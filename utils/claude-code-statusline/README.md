# Claude Code Statusline

Hiển thị thanh trạng thái trong terminal mỗi khi Claude Code gửi notification.

```
[Claude Sonnet 4] 📁 my-project | 🌿 feature/login
████████░░ 80% | $0.42 | ⏱️ 5m 12s
```

| Thông tin | Mô tả | Ví dụ |
|---|---|---|
| 🤖 **Model** | Tên model đang sử dụng | `[Claude Sonnet 4]` |
| 📁 **Thư mục** | Thư mục làm việc hiện tại | `my-project` |
| 🌿 **Git branch** | Nhánh git đang active | `feature/login` |
| 📊 **Context window** | % context đã dùng (progress bar) | `████░░░░░░ 40%` |
| 💰 **Chi phí** | Tổng chi phí phiên hiện tại (USD) | `$0.15` |
| ⏱️ **Thời gian** | Tổng thời gian chạy | `2m 35s` |

Progress bar đổi màu theo context usage: 🟢 xanh (<70%) → 🟡 vàng (70-89%) → 🔴 đỏ (≥90%)

## Yêu cầu

- Claude Code ≥ 1.0.34
- `jq` — `brew install jq`

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
cp utils/claude-code-statusline/statusline.sh ~/.claude/hooks/statusline.sh
chmod +x ~/.claude/hooks/statusline.sh
```

**3. Thêm hook vào `~/.claude/settings.json`:**

```json
{
  "hooks": {
    "Notification": [
      {
        "matcher": "",
        "hooks": [
          {
            "type": "command",
            "command": "bash ~/.claude/hooks/statusline.sh"
          }
        ]
      }
    ]
  }
}
```

**4. Test:**

```bash
echo '{"model":{"display_name":"Test"},"workspace":{"current_dir":"/tmp/test"},"cost":{"total_cost_usd":0.05,"total_duration_ms":65000},"context_window":{"used_percentage":42.5}}' | bash ~/.claude/hooks/statusline.sh
```

---

## Cách Hoạt Động

### Luồng dữ liệu

```
Claude Code gửi Notification event
        │
        ▼
   Hook system bắt event
        │
        ▼
   JSON data → stdin → statusline.sh
        │
        ▼
   jq parse các trường: model, workspace, cost, context_window
        │
        ▼
   Tính toán progress bar + màu sắc
        │
        ▼
   In ra terminal (stdout)
```

### Dữ liệu đầu vào (stdin JSON)

| Trường | Path (jq) | Mô tả |
|---|---|---|
| Model name | `.model.display_name` | Tên model đang chạy |
| Working dir | `.workspace.current_dir` | Đường dẫn thư mục hiện tại |
| Cost | `.cost.total_cost_usd` | Tổng chi phí (USD) |
| Context usage | `.context_window.used_percentage` | % context window đã dùng |
| Duration | `.cost.total_duration_ms` | Tổng thời gian (milliseconds) |

### Logic progress bar

```bash
# Tổng 10 ô, chia theo %
FILLED = PCT / 10
EMPTY  = 10 - FILLED

# Ví dụ: 73% → ███████░░░ 73%
```

### Logic màu sắc

| Context usage | Màu | Ý nghĩa |
|---|---|---|
| < 70% | 🟢 Xanh | An toàn |
| 70% – 89% | 🟡 Vàng | Cần lưu ý |
| ≥ 90% | 🔴 Đỏ | Sắp hết — nên compact hoặc mở session mới |

### Git branch

Script tự kiểm tra `git rev-parse --git-dir`. Nếu đang trong git repo → hiển thị branch hiện tại. Nếu không → bỏ qua (không lỗi).
