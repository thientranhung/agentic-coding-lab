# Hook Notify Agent

Gửi thông báo Telegram mỗi khi Claude Code có event (notification, stop, session start/end).

```
[my-project] Session started 🚀
[my-project] 🏁 Đã hoàn thành refactor module auth
[my-project] Response finished 🏁
```

| Thông tin | Mô tả |
|---|---|
| 📁 **Project name** | Tự detect từ `cwd` trong JSON input |
| 📨 **Event type** | SessionStart, Stop, Notification, v.v. |
| 💬 **Message** | Nội dung notification hoặc tin nhắn cuối của Claude |
| 🧵 **Forum topic** | Hỗ trợ gửi vào topic cụ thể (Telegram Group Forum) |

Mỗi event có emoji và format riêng:

| Event | Output |
|---|---|
| `SessionStart` | `[project] Session started 🚀` |
| `Stop` | `[project] 🏁 <nội dung cuối>` |
| `Notification` | `[project] <message>` |
| Khác | `[project] <event>: <message>` |

## Yêu cầu

- Claude Code ≥ 1.0.34
- `jq` — `brew install jq`
- `curl`
- Telegram Bot Token + Chat ID ([tạo bot](https://core.telegram.org/bots#how-do-i-create-a-bot))

## Cài đặt

**1. Cài jq (nếu chưa có):**

```bash
# macOS
brew install jq

# Ubuntu/Debian
sudo apt-get install jq
```

**2. Copy script:**

```bash
mkdir -p ~/.claude/hooks
cp utils/hook-notify-agent/notify.sh ~/.claude/hooks/notify.sh
cp utils/hook-notify-agent/.env ~/.claude/hooks/.env
chmod +x ~/.claude/hooks/notify.sh
```

**3. Cấu hình `.env`:**

```bash
# Sửa file ~/.claude/hooks/.env
TELE_CHAT_ID="your-chat-id"
TELE_TOKEN="your-bot-token"
# Optional: gửi vào topic cụ thể trong Group Forum
TELE_TOPIC_ID=""
```

> Lấy `TELE_CHAT_ID`: chat với [@userinfobot](https://t.me/userinfobot) hoặc [@RawDataBot](https://t.me/RawDataBot).

**4. Thêm hook vào `~/.claude/settings.json`:**

```json
{
  "hooks": {
    "Notification": [
      {
        "matcher": "",
        "hooks": [
          {
            "type": "command",
            "command": "bash ~/.claude/hooks/notify.sh"
          }
        ]
      }
    ],
    "Stop": [
      {
        "matcher": "",
        "hooks": [
          {
            "type": "command",
            "command": "bash ~/.claude/hooks/notify.sh"
          }
        ]
      }
    ]
  }
}
```

**5. Test:**

```bash
echo '{"message":"Hello from test","hook_event_name":"Notification","cwd":"/tmp/my-project"}' | bash ~/.claude/hooks/notify.sh
```

→ Kiểm tra Telegram, nếu nhận được tin nhắn `[my-project] Hello from test` là thành công.

---

## Cách Hoạt Động

### Luồng dữ liệu

```
Claude Code event (Notification/Stop/SessionStart)
        │
        ▼
   Hook system truyền JSON → stdin → notify.sh
        │
        ▼
   jq parse: message, event type, cwd
        │
        ▼
   Format tin nhắn theo event type (HTML)
        │
        ▼
   curl gửi Telegram Bot API (async, non-blocking)
```

### Xử lý event Stop

Với event `Stop`, script cố gắng đọc **tin nhắn cuối cùng** của Claude từ transcript file:

1. Kiểm tra `transcript_path` trong JSON input
2. Nếu có → đợi 0.5s (chờ flush) → grep dòng assistant cuối → lấy text
3. Nếu không có transcript → dùng `raw_message` hoặc fallback "Response finished 🏁"

### Giới hạn

- Tin nhắn tự động **truncate ở 4096 ký tự** (giới hạn Telegram API)
- `curl` chạy **background** (`&`) nên không block Claude Code
