#!/usr/bin/env bash
# quickly push develop to origin and master
# usefull for projects im a lone wolf on
git_quick_publish() {
  git push origin develop
  git push origin develop:master
}