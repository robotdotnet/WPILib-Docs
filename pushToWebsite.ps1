if ($env:APPVEYOR) {
    $localFolder = "$env:APPVEYOR_BUILD_FOLDER"
} else {
    $localFolder = "."
}

git clone https://github.com/robotdotnet/robotdotnet.github.io.git origin_site --depth=1

if ($env:APPVEYOR)
{
  git config --global credential.helper store
  Add-Content "$env:USERPROFILE\.git-credentials" "https://$($env:access_token):x-oauth-basic@github.com`n"
  git config --global user.email $env:op_build_user_email
  git config --global user.name $env:op_build_user
}

Copy-Item origin_site/.git _site -recurse
CD _site
git add -A 2>&1
git commit -m "CI Website Updates"
git push origin master
