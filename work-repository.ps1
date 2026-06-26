#region WORK-REPOSITORY
  git submodule update --init --recursive
  git submodule foreach git pull origin main
  git submodule foreach git reset --hard "origin/main"
#endregion #################################### #################################### ####################################

#region SET DIRECTORY CONTEXT
  # POWER SHELL set location to the folder "work-repository"
  Set-Location (Split-Path $psEditor.GetEditorContext().CurrentFile.Path)
  # POWER SHELL set location to the folder "notes"
  Set-Location "$(Split-Path $psEditor.GetEditorContext().CurrentFile.Path)\notes"
  # POWER SHELL set location to the folder "power-shell"
  Set-Location "$(Split-Path $psEditor.GetEditorContext().CurrentFile.Path)\power-shell"
#endregion #################################### #################################### ####################################

#region GIT
  # GIT show current branch or detached state
  $branch = git symbolic-ref --short HEAD 2>$null; if (-not $branch) { git rev-parse --short HEAD } else { $branch }
  # GIT checkout / switch to the main branch
  git checkout main
  # GIT pull origin main
  git fetch; git pull "origin/main"
  # GIT pull force origin main
  git fetch; git reset --hard "origin/main"
  
  # GIT stash and rebase interactive
  git stash save "TEMP_$(Get-Date -Format "yyyy-MM-dd_HH:mm")"; git rebase -i --root; #-i --root; #-i Head~9
  # GIT stash and pull changes
  git stash save "TEMP_$(Get-Date -Format "yyyy-MM-dd_HH:mm")"; git pull;
  # GIT stash apply / pop
  git stash pop #apply #pop
  # GIT get origin url
  git remote get-url origin
#endregion #################################### #################################### ####################################
