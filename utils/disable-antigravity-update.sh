#!/bin/bash
# Disable Antigravity auto-update
# Chay script nay SAU khi cai Antigravity, TRUOC khi mo app

APP="/Applications/Antigravity.app"
SHIPIT="$APP/Contents/Frameworks/Squirrel.framework/Versions/A/Resources/ShipIt"
SETTINGS_DIR="$HOME/Library/Application Support/Antigravity/User"
SETTINGS="$SETTINGS_DIR/settings.json"
CACHE="$HOME/Library/Caches/com.google.antigravity.ShipIt"

# Kiem tra app ton tai
if [ ! -d "$APP" ]; then
    echo "Khong tim thay Antigravity tai $APP"
    exit 1
fi

# 1. Tat ShipIt updater
if [ -f "$SHIPIT" ]; then
    chmod -x "$SHIPIT"
    echo "[OK] Da tat ShipIt updater"
else
    echo "[SKIP] Khong tim thay ShipIt"
fi

# 2. Tao settings tat update
mkdir -p "$SETTINGS_DIR"
if [ -f "$SETTINGS" ]; then
    # Neu da co settings.json, them update.mode neu chua co
    if grep -q '"update.mode"' "$SETTINGS"; then
        echo "[SKIP] update.mode da co trong settings.json"
    else
        # Chen truoc dau } cuoi cung
        sed -i '' 's/}$/,"update.mode": "none"}/' "$SETTINGS"
        echo "[OK] Da them update.mode vao settings.json"
    fi
else
    echo '{"update.mode": "none"}' > "$SETTINGS"
    echo "[OK] Da tao settings.json voi update.mode = none"
fi

# 3. Tat Antigravity neu dang chay
if pgrep -f "Antigravity" > /dev/null 2>&1; then
    pkill -f "Antigravity"
    echo "[OK] Da tat Antigravity"
    sleep 1
fi

# 4. Xoa cache update va chan tao lai
rm -rf "$CACHE"
touch "$CACHE"
echo "[OK] Da xoa va chan cache updater"

echo ""
echo "Hoan tat! Bay gio co the mo Antigravity."
