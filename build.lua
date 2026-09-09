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
--]]
tagfiles = { "*.dtx", "README.md" }

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
