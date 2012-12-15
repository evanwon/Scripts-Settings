$sourceCode	= "S:\SourceCode"

if (Test-Path $sourceCode)
{
	$codeGitHub		= Join-Path $sourceCode "GitHub"
	$codeCodePlex 	= Join-Path $sourceCode "CodePlex"
	$codeBitBucket	= Join-Path $sourceCode "Bitbucket"
}
