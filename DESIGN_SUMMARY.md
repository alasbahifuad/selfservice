# 📐 Self-Service App — Design Summary

> مرجع تصميمي شامل مستخرج من تحليل 32 شاشة + ملف DESIGN.md

---

## 1. 🎨 Color Palette (Material 3 Tokens)

### Primary Colors
| Token | Hex | Usage |
|-------|-----|-------|
| `primary` | `#904d00` | App bar titles, active icons, accent text |
| `primary-container` | `#ff8c00` | Hero gradients, CTA buttons, large surfaces |
| `on-primary` | `#ffffff` | Text on primary backgrounds |
| `on-primary-container` | `#623200` | Text on primary-container |
| `primary-fixed` | `#ffdcc3` | Soft tinted backgrounds |
| `primary-fixed-dim` | `#ffb77d` | Inverse primary, warm highlights |

### Secondary Colors
| Token | Hex | Usage |
|-------|-----|-------|
| `secondary` | `#435b9f` | Login button, secondary actions |
| `secondary-container` | `#9cb4fe` | Badges, chips |
| `on-secondary` | `#ffffff` | Text on secondary |

### Tertiary Colors
| Token | Hex | Usage |
|-------|-----|-------|
| `tertiary` | `#00658f` | Info icons, tertiary actions |
| `tertiary-container` | `#00b5fc` | Accent highlights |

### Surface System
| Token | Hex | Usage |
|-------|-----|-------|
| `surface` / `background` | `#f8f9fa` | Main body background |
| `surface-container-lowest` | `#ffffff` | Card backgrounds |
| `surface-container-low` | `#f3f4f5` | Subtle elevation |
| `surface-container` | `#edeeef` | Medium elevation |
| `surface-container-high` | `#e7e8e9` | Higher elevation |
| `surface-container-highest` | `#e1e3e4` | Drawer background |
| `inverse-surface` | `#2e3132` | Dark mode inverse |

### Semantic Colors
| Token | Hex | Usage |
|-------|-----|-------|
| `error` | `#ba1a1a` | Errors, absence badges |
| `error-container` | `#ffdad6` | Error backgrounds |
| `on-surface` | `#191c1d` | Primary text |
| `on-surface-variant` | `#564334` | Secondary text |
| `outline` | `#897362` | Subtle borders |
| `outline-variant` | `#ddc1ae` | Very subtle dividers |

### Gradient Patterns
- **Hero Cards**: `from-primary (#904d00) to primary-container (#ff8c00)`
- **Splash Screen**: Orange gradient background with glassmorphism icon
- **Direction**: bottom-right diagonal
- **Decorative blurs**: White circles at 10% opacity with blur

---

## 2. 🔤 Typography

| Role | Font Family | Weight |
|------|------------|--------|
| Headline (Latin) | Plus Jakarta Sans | 700-800 |
| Headline (Arabic) | IBM Plex Sans Arabic | 700 |
| Body | Work Sans | 400-600 |
| Body (Arabic) | Cairo | 400-700 |

### Scale
- Page titles: 1.875rem (30px) — bold/extrabold
- Section headers: 1.25rem (20px) — bold
- Card titles: 1.125rem (18px) — bold
- Body text: 0.875rem (14px)
- Labels/Captions: 0.75rem (12px)

---

## 3. 🃏 Card Patterns

### Standard Card
- Background: `#ffffff` (surface-container-lowest)
- Border radius: 24px (`1.5rem`)
- Border: very subtle `outline-variant` at 15% opacity
- Shadow: subtle, increases on hover
- Padding: 20-24px
- **No visible borders** — depth via surface color levels

### Hero/Summary Card
- Background: gradient primary → primary-container
- Border radius: 24px
- Text: white
- Shadow: orange-tinted `rgba(144,77,0,0.15)`
- Decorative blur circles inside

### Status Card (Attendance)
- Left colored border for status
- Green = حاضر, Orange = متأخر, Red = غائب
- Date displayed prominently

---

## 4. 🧭 Navigation Patterns

### Bottom Navigation Bar (Mobile)
- Fixed bottom, glassmorphism (`backdrop-blur-xl`)
- Background: white at 80% opacity
- Border radius top: 1.5rem (24px)
- 4 tabs: icon + Arabic label
- Active: orange tint background + filled icon
- Inactive: muted text + outlined icon
- Safe area padding bottom: 24px

### Tab Variations
| Context | Tabs |
|---------|------|
| Employee Home | الرئيسية، الحضور، الخصومات، الراتب |
| Employee Alt | الرئيسية، الحضور، التنبيهات، الملف الشخصي |
| Admin | الرئيسية، الطلبات، الإعدادات، الحساب |
| Tasks | الرئيسية، المهام، المصروفات، الحساب |
| Evaluation | الرئيسية، الطلبات، التقييم، الإعدادات |

### Top App Bar
- Background: primary color
- Border radius bottom: 24px (mobile)
- Content: avatar, title (center), action icon

---

## 5. 📱 Screens Inventory (28 unique screens)

| # | Screen | Description |
|---|--------|-------------|
| 1 | شاشة البداية | Splash with gradient + logo |
| 2 | تسجيل الدخول | Login form |
| 3 | الرئيسية (موظف) | Employee home + stats + shortcuts |
| 4 | الرئيسية (بديل) | Alt employee home layout |
| 5 | الحضور | Check-in/out with GPS |
| 6 | سجل الحضور | Attendance log with month tabs |
| 7 | التنبيهات | Notifications with category filters |
| 8 | الملف الشخصي | Profile/account page |
| 9 | تعديل الملف | Edit profile form |
| 10 | إدارة الإجازات | Leave management + history |
| 11 | قسيمة الراتب | Salary slip detail |
| 12 | الخصومات | Deductions list |
| 13 | التقارير الشهرية | Monthly reports stats |
| 14 | تقديم طلب | Submit request form |
| 15 | إدارة الطلبات | Request management + tabs |
| 16 | تفاصيل الطلب | Request detail + timeline |
| 17 | لوحة المعلومات | Admin dashboard + charts |
| 18 | إدارة الموظفين | Employee list + search |
| 19 | ملف الموظف | Employee detail view |
| 20 | إعدادات النظام | System settings grid |
| 21 | مهامي الحالية | Tasks + status + reminders |
| 22 | مصروفاتي | Expenses + chart |
| 23 | إعدادات معايير التقييم | Eval criteria config |
| 24 | تقييم الأداء الشهري | Monthly eval form |
| 25 | تقرير تقييم الموظف | Employee eval report |
| 26 | تقرير التقييم الإجمالي | Overall eval report |
| 27 | سجل الأحداث | Audit/event log timeline |
| 28 | إعدادات النظام (بديل) | Alt settings layout |

---

## 6. 📝 Form Patterns

- Input fields: Rounded, subtle background, no hard borders
- Labels: Above field, right-aligned
- Icons: Inside field as prefix/suffix
- Date pickers: Calendar icon suffix
- Dropdowns: Chevron suffix
- Submit buttons: Full-width gradient, rounded
- Form sections: Grouped in cards

---

## 7. 📊 Report/Table Patterns

- Salary slip: Label-value rows with currency
- Reports: Stat cards with icon + large number (not tables)
- Attendance log: Day-based cards
- Evaluation: Star ratings (1-5)
- Charts: Donut/pie for analysis
- Progress bars: Colored percentage indicators

---

## 8. 🔔 Status Badges

| Status | Color | Icon |
|--------|-------|------|
| حاضر (Present) | Green | ✓ check |
| متأخر (Late) | Orange | ◷ clock |
| غائب (Absent) | Red | ✕ close |
| مقبول (Approved) | Green | ✓ |
| مرفوض (Rejected) | Red | ✕ |
| قيد الانتظار (Pending) | Orange | ◷ |

---

## 9. 📐 Layout Principles

- **Direction**: RTL (`dir="rtl" lang="ar"`)
- **Min touch target**: 48dp
- **Content width**: max 896px mobile, max 1280px desktop
- **Page padding**: 24px mobile, 40px desktop
- **Section spacing**: 32-48px between sections
- **Grid**: 1 col mobile → 2 col tablet → 4 col desktop
- **Footer**: Centered copyright with top border

---

## 10. ✨ Animation Patterns

- Hover shadows: 300ms transition
- Button press: scale down 95%
- Icon hover: scale up 110%
- Bottom border reveal on hover
- Color transitions: 200ms
- Backdrop blur on navigation bars

---

## 11. 🖼️ Icon System

- Library: Material Symbols Outlined (Google Fonts)
- Sizes: 20px (nav), 24px (bottom bar), 28-32px (cards)
- Active: filled style (`FILL 1`)
- Inactive: outlined
- Containers: Circular with tinted background

---

## 12. 🌟 6 Key Design Rules

1. **No-Line Rule**: No separator lines — use surface color contrast
2. **Editorial Style**: White space, gradients, bold typography
3. **Surface Depth**: Use surface levels (lowest→highest) for depth
4. **Glassmorphism**: Backdrop blur + transparency for nav bars
5. **Rounded Everything**: Minimum `rounded-xl`, usually 24px
6. **Gradient Hero**: Every main page starts with gradient hero card
