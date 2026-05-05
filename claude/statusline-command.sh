#!/bin/sh
# Claude Code status line — inspired by Powerlevel10k p10k-rainbow layout
# Segments: dir | git branch | model | context usage | user@host

input=$(cat)

# --- Directory ---
cwd=$(echo "$input" | jq -r '.workspace.current_dir // .cwd // ""')
# Abbreviate $HOME to ~
home="$HOME"
short_dir="${cwd/#$home/\~}"

# --- Git branch (skip optional locks) ---
git_branch=""
if git -C "$cwd" --no-optional-locks rev-parse --is-inside-work-tree 2>/dev/null | grep -q true; then
  branch=$(git -C "$cwd" --no-optional-locks symbolic-ref --short HEAD 2>/dev/null)
  if [ -n "$branch" ]; then
    # Check for uncommitted changes
    if git -C "$cwd" --no-optional-locks diff --quiet 2>/dev/null && \
       git -C "$cwd" --no-optional-locks diff --cached --quiet 2>/dev/null; then
      git_branch=" \033[32m$branch\033[0m"
    else
      git_branch=" \033[33m$branch*\033[0m"
    fi
  fi
fi

# --- Model ---
model=$(echo "$input" | jq -r '.model.display_name // ""')

# --- Context usage ---
used_pct=$(echo "$input" | jq -r '.context_window.used_percentage // empty')
ctx_part=""
if [ -n "$used_pct" ]; then
  used_int=$(printf "%.0f" "$used_pct")
  if [ "$used_int" -ge 80 ]; then
    ctx_color="\033[31m"   # red
  elif [ "$used_int" -ge 50 ]; then
    ctx_color="\033[33m"   # yellow
  else
    ctx_color="\033[32m"   # green
  fi
  ctx_part=" ${ctx_color}ctx:${used_int}%\033[0m"
fi

# --- User@host ---
user_host="\033[36m$(whoami)@$(hostname -s)\033[0m"

# --- Assemble ---
printf "\033[34m%s\033[0m%b | %s%b | %b" \
  "$short_dir" \
  "$git_branch" \
  "$model" \
  "$ctx_part" \
  "$user_host"
