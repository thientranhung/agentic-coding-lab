# Claude Code Statusline

Hiển thị thanh trạng thái trong terminal mỗi khi Claude Code gửi notification — bao gồm thông tin **quota/rate limits** cho Claude.ai subscribers.

```
[Claude Sonnet 4] 🔑 Claude.ai | 📁 my-project | 🌿 feature/login
████████░░ 80% | $0.42 | ⏱️ 5m 12s
⚡ 5h: 45.2% ↻2h15m | 7d: 12.8% ↻6d3h
```

| Thông tin | Mô tả | Ví dụ |
|---|---|---|
| 🤖 **Model** | Tên model đang sử dụng | `[Claude Sonnet 4]` |
| 🔑 **Auth mode** | Tự nhận diện Claude.ai hoặc API Key | `Claude.ai` / `API Key` |
| 📁 **Thư mục** | Thư mục làm việc hiện tại | `my-project` |
| 🌿 **Git branch** | Nhánh git đang active | `feature/login` |
| 📊 **Context window** | % context đã dùng (progress bar) | `████░░░░░░ 40%` |
| 💰 **Chi phí** | Tổng chi phí phiên hiện tại (USD) | `$0.15` |
| ⏱️ **Thời gian** | Tổng thời gian chạy | `2m 35s` |
| ⚡ **Quota 5h** | % quota đã dùng trong 5 giờ gần nhất | `45.2%` (color-coded) |
| ⚡ **Quota 7d** | % quota đã dùng trong 7 ngày | `12.8%` (color-coded) |
| ↻ **Reset** | Thời gian còn lại đến khi quota reset | `2h15m` / `6d3h` |

Progress bar & quota đổi màu theo mức sử dụng: 🟢 xanh (<70%) → 🟡 vàng (70-89%) → 🔴 đỏ (≥90%)

> **Note:** Dòng quota chỉ hiển thị khi dùng Claude.ai subscription (có `rate_limits` data). Nếu dùng API Key, dòng này sẽ tự động ẩn.

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

**2. Tải script từ GitHub:**

```bash
mkdir -p ~/.claude/hooks
curl -o ~/.claude/hooks/statusline.sh \
  https://raw.githubusercontent.com/thientranhung/agentic-coding-lab/main/utils/claude-code-statusline/statusline.sh
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
# Test với rate limits (Claude.ai mode)
echo '{"model":{"display_name":"Claude Sonnet 4"},"workspace":{"current_dir":"/tmp/test"},"cost":{"total_cost_usd":0.42,"total_duration_ms":312000},"context_window":{"used_percentage":80},"rate_limits":{"five_hour":{"used_percentage":45.2,"resets_at":'$(($(date +%s)+8100))'},"seven_day":{"used_percentage":12.8,"resets_at":'$(($(date +%s)+529200))'}}}' | bash ~/.claude/hooks/statusline.sh

# Test không có rate limits (API Key mode)
echo '{"model":{"display_name":"Claude Sonnet 4"},"workspace":{"current_dir":"/tmp/test"},"cost":{"total_cost_usd":0.05,"total_duration_ms":65000},"context_window":{"used_percentage":42.5}}' | bash ~/.claude/hooks/statusline.sh
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
   jq parse: model, workspace, cost, context_window, rate_limits
        │
        ▼
   Nhận diện auth mode (Claude.ai / API Key)
        │
        ▼
   Tính toán progress bar + màu sắc + quota info
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
| Rate limits 5h | `.rate_limits.five_hour.used_percentage` | % quota 5 giờ đã dùng |
| Rate limits 5h reset | `.rate_limits.five_hour.resets_at` | Unix timestamp reset quota 5h |
| Rate limits 7d | `.rate_limits.seven_day.used_percentage` | % quota 7 ngày đã dùng |
| Rate limits 7d reset | `.rate_limits.seven_day.resets_at` | Unix timestamp reset quota 7d |

### Logic progress bar

```bash
# Tổng 10 ô, chia theo %
FILLED = PCT / 10
EMPTY  = 10 - FILLED

# Ví dụ: 73% → ███████░░░ 73%
```

### Logic màu sắc

| Mức sử dụng | Màu | Ý nghĩa |
|---|---|---|
| < 70% | 🟢 Xanh | An toàn |
| 70% – 89% | 🟡 Vàng | Cần lưu ý |
| ≥ 90% | 🔴 Đỏ | Sắp hết — nên compact hoặc mở session mới |

> Bảng màu này áp dụng cho **cả** context window progress bar **và** quota percentages.

### Auth mode detection

Script tự nhận diện auth mode dựa trên sự có mặt của `rate_limits` trong JSON data:
- Có `rate_limits` → **Claude.ai** subscriber → hiển thị quota info
- Không có `rate_limits` → **API Key** → ẩn dòng quota

### Git branch

Script tự kiểm tra `git rev-parse --git-dir`. Nếu đang trong git repo → hiển thị branch hiện tại. Nếu không → bỏ qua (không lỗi).
