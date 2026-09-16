module = "nkthesis"

sourcefiledir = "source"
docfiledir = "doc"
supportdir = sourcefiledir

unpackexe = "xelatex"
typesetexe = "xelatex"
makeindexexe = "upmendex"

unpackfiles = { "nkthesis.ins" }
sourcefiles = {
  "nkthesis.dtx",
  "nkthesis-logo.dtx",
  "locale/zh.dtx",
  "locale/en.dtx",
  "nkthesis.ins",
  "nkthesis.ist",
}
installfiles = { "*.cls" }
makeindexfiles = { "nkthesis.ist" }
typesetfiles = { "nkthesis.dtx" }

-- l3build copies entries in typesetdemofiles directly to build/doc/, which
-- loses the demo/ working directory needed by the \input commands.  Typeset
-- the preserved tree explicitly, then publish the resulting PDF to doc/demo/.
function typeset_demo_tasks()
  local errorlevel = typeset("demo.tex", typesetdir .. "/demo")
  if errorlevel ~= 0 then
    return errorlevel
  end
  return cp("demo.pdf", typesetdir .. "/demo", docfiledir .. "/demo")
end


docfiles = { "demo" }
demofiles = { "demo" }

-- gind.ist supplies docstrip's conventional index layout; nkthesis.ist adds
-- the Chinese collation and heading settings required by this documentation.
makeindexopts = "-s gind.ist"
indexstyle = "nkthesis.ist"
typesetopts = "-shell-escape -file-line-error -halt-on-error -interaction=nonstopmode -synctex=1"

-- Produce nkthesis.tds.zip alongside the CTAN archive.
packtdszip = true

checkengines = { "xetex" }
checkruns = 2

--[[
  Version tagging.

  The version number and date appear in three places that must stay in sync:
    * \ProvidesExplClass in nkthesis.dtx (the authoritative declaration)
    * \date in the nkthesis.dtx documentation preamble
    * the version badge in README.md

  `l3build tag vX.Y.Z` rewrites all three at once, so releasing no longer
  depends on remembering to update each by hand:

      l3build tag vX.Y.Z

  The date is taken from the system clock on the day the command is run.
  Note that l3build's --date option is parsed as a second tag name and is
  rejected ("Too many tags specified"), so pass the tag name only.

  The license year in the copyright notices is rolled forward at the same time:
  the release year is merged into the existing year list, consecutive years
  collapse into ranges and gaps become comma-separated fields.
--]]
tagfiles = { "*.dtx", "locale/*.dtx", "*.ins", "*.ist", "README.md" }

-- Expand a copyright year field into a sorted list of years.
local function parse_years(text)
  local years = {}
  for item in string.gmatch(text, "[^,%s]+") do
    local first, last = string.match(item, "^(%d%d%d%d)%-(%d%d%d%d)$")
    if first then
      for year = tonumber(first), tonumber(last) do
        years[#years + 1] = year
      end
    else
      years[#years + 1] = tonumber(item)
    end
  end
  table.sort(years)
  return years
end

-- Compress a sorted year list back into range form: consecutive years become
-- "a-b" spans, gaps become comma-separated fields.
local function format_years(years)
  local parts = {}
  local i = 1
  while i <= #years do
    local j = i
    while years[j + 1] == years[j] + 1 do
      j = j + 1
    end
    if j > i then
      parts[#parts + 1] = years[i] .. "-" .. years[j]
    else
      parts[#parts + 1] = tostring(years[i])
    end
    i = j + 1
  end
  return table.concat(parts, ",")
end

-- Roll the copyright notice forward to include the release year.
local function update_license_years(content, tagdate)
  local releaseyear = tonumber(string.match(tagdate, "^(%d%d%d%d)"))
  if not releaseyear then
    return content
  end
  return string.gsub(content,
    "(Copyright%s+)([%d%s,%-]+)(%s+Zhenyu Zhong)",
    function(prefix, years, suffix)
      local seen = {}
      local merged = {}
      for _, year in ipairs(parse_years(years)) do
        if not seen[year] then
          seen[year] = true
          merged[#merged + 1] = year
        end
      end
      if not seen[releaseyear] then
        seen[releaseyear] = true
        merged[#merged + 1] = releaseyear
      end
      table.sort(merged)
      return prefix .. format_years(merged) .. suffix
    end)
end

function update_tag(filename, content, tagname, tagdate)
  if not tagname then
    return content
  end

  local slashdate = string.gsub(tagdate, "%-", "/")
  -- Strip a leading "v" so both "v2026.8.0" and "2026.8.0" are accepted.
  local bareversion = string.gsub(tagname, "^v", "")
  local version = "v" .. bareversion

  if filename == "README.md" then
    -- ![version X.Y.Z](https://img.shields.io/badge/version-X.Y.Z-blue)
    content = string.gsub(content,
      "!%[version [^%]]*%]%(https://img%.shields%.io/badge/version%-[^%-]*%-blue%)",
      "![version " .. bareversion .. "]"
        .. "(https://img.shields.io/badge/version-" .. bareversion .. "-blue)")
    return content
  end

  -- Copyright YYYY-YYYY[,YYYY] Zhenyu Zhong
  content = update_license_years(content, tagdate)

  -- %<class>    {YYYY/MM/DD}
  -- %<class>    {vX.Y.Z}
  content = string.gsub(content,
    "(\n%%<class>%s*){%d%d%d%d/%d%d/%d%d}",
    "%1{" .. slashdate .. "}")
  content = string.gsub(content,
    "(\n%%<class>%s*){v[^}]*}",
    "%1{" .. version .. "}")

  -- % \date{YYYY/MM/DD\qquad vX.Y.Z}
  content = string.gsub(content,
    "\\date{%d%d%d%d/%d%d/%d%d\\qquad v[^}]*}",
    "\\date{" .. slashdate .. "\\qquad " .. version .. "}")

  return content
end
