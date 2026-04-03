#!/bin/bash
input=$(cat)

MODEL=$(echo "$input" | jq -r '.model.display_name')
DIR=$(echo "$input" | jq -r '.workspace.current_dir')
# Infer auth type: Claude.ai subscribers have rate_limits data; otherwise API key
HAS_RATE_LIMITS=$(echo "$input" | jq -r '.rate_limits // empty')
if [ -n "$HAS_RATE_LIMITS" ]; then
  MODE="Claude.ai"
else
  MODE="API Key"
fi
COST=$(echo "$input" | jq -r '.cost.total_cost_usd // 0')
PCT=$(echo "$input" | jq -r '.context_window.used_percentage // 0' | cut -d. -f1)
DURATION_MS=$(echo "$input" | jq -r '.cost.total_duration_ms // 0')

# Rate limits (5-hour and 7-day windows)
RL_5H_PCT=$(echo "$input" | jq -r '.rate_limits.five_hour.used_percentage // empty')
RL_5H_RESET=$(echo "$input" | jq -r '.rate_limits.five_hour.resets_at // empty')
RL_7D_PCT=$(echo "$input" | jq -r '.rate_limits.seven_day.used_percentage // empty')
RL_7D_RESET=$(echo "$input" | jq -r '.rate_limits.seven_day.resets_at // empty')

CYAN='\033[36m'; GREEN='\033[32m'; YELLOW='\033[33m'; RED='\033[31m'; MAGENTA='\033[35m'; RESET='\033[0m'

# Pick bar color based on context usage
if [ "$PCT" -ge 90 ]; then BAR_COLOR="$RED"
elif [ "$PCT" -ge 70 ]; then BAR_COLOR="$YELLOW"
else BAR_COLOR="$GREEN"; fi

FILLED=$((PCT / 10)); EMPTY=$((10 - FILLED))
BAR=$(printf "%${FILLED}s" | tr ' ' '█')$(printf "%${EMPTY}s" | tr ' ' '░')

MINS=$((DURATION_MS / 60000)); SECS=$(((DURATION_MS % 60000) / 1000))

BRANCH=""
git rev-parse --git-dir > /dev/null 2>&1 && BRANCH=" | 🌿 $(git branch --show-current 2>/dev/null)"

# Helper: color a percentage value
color_pct() {
  local pct="${1%.*}"
  if [ "$pct" -ge 90 ] 2>/dev/null; then echo "${RED}${1}%${RESET}"
  elif [ "$pct" -ge 70 ] 2>/dev/null; then echo "${YELLOW}${1}%${RESET}"
  else echo "${GREEN}${1}%${RESET}"; fi
}

# Helper: format unix timestamp to relative remaining time
fmt_reset() {
  local reset_ts="$1"
  if [ -z "$reset_ts" ] || [ "$reset_ts" = "null" ]; then echo ""; return; fi
  local now_epoch diff_s
  now_epoch=$(date "+%s")
  diff_s=$((reset_ts - now_epoch))
  if [ "$diff_s" -le 0 ]; then echo "now"; return; fi
  local h=$((diff_s / 3600)) m=$(((diff_s % 3600) / 60))
  if [ "$h" -gt 0 ]; then echo "${h}h${m}m"
  else echo "${m}m"; fi
}

# Line 1: model, mode, dir, branch
echo -e "${CYAN}[$MODEL]${RESET} 🔑 ${MODE} | 📁 ${DIR##*/}$BRANCH"

# Line 2: context bar, cost, duration
COST_FMT=$(printf '$%.2f' "$COST")
echo -e "${BAR_COLOR}${BAR}${RESET} ${PCT}% | ${YELLOW}${COST_FMT}${RESET} | ⏱️ ${MINS}m ${SECS}s"

# Line 3: rate limits (only if data available)
if [ -n "$RL_5H_PCT" ] && [ "$RL_5H_PCT" != "null" ]; then
  RL_5H_DISPLAY=$(color_pct "$RL_5H_PCT")
  RL_5H_REMAINING=$(fmt_reset "$RL_5H_RESET")
  RL_7D_DISPLAY=""
  if [ -n "$RL_7D_PCT" ] && [ "$RL_7D_PCT" != "null" ]; then
    RL_7D_DISPLAY=$(color_pct "$RL_7D_PCT")
    RL_7D_REMAINING=$(fmt_reset "$RL_7D_RESET")
    RL_7D_STR=" | ${MAGENTA}7d:${RESET} ${RL_7D_DISPLAY}"
    [ -n "$RL_7D_REMAINING" ] && RL_7D_STR="${RL_7D_STR} ↻${RL_7D_REMAINING}"
  fi
  RL_LINE="${MAGENTA}5h:${RESET} ${RL_5H_DISPLAY}"
  [ -n "$RL_5H_REMAINING" ] && RL_LINE="${RL_LINE} ↻${RL_5H_REMAINING}"
  echo -e "⚡ ${RL_LINE}${RL_7D_STR}"
fi
