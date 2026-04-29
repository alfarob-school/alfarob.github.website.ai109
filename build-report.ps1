param(
  [string]$InputFile = "career-report.md",
  [string]$OutputFile = "career-report.docx",
  [string]$ReferenceDoc = "pandoc-reference.docx"
)

$ErrorActionPreference = "Stop"

if (-not (Test-Path -LiteralPath $InputFile)) {
  throw "Input markdown file not found: $InputFile"
}

if (-not (Test-Path -LiteralPath $ReferenceDoc)) {
  throw "Pandoc reference document not found: $ReferenceDoc"
}

pandoc $InputFile --reference-doc=$ReferenceDoc -o $OutputFile
Write-Host "Generated $OutputFile using $ReferenceDoc"
