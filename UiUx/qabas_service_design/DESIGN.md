# Design System Specification: The Fluid Administrative Experience

## 1. Overview & Creative North Star
**Creative North Star: "The Empowered Citizen"**

Traditional government and administrative apps often feel rigid, cold, and claustrophobic. This design system breaks that mold by adopting a "High-End Editorial" approach to self-service. We are moving away from the "grid of buttons" to a layout that feels curated, spacious, and authoritative. 

The system achieves a premium feel through **intentional asymmetry**, **exaggerated white space**, and **tonal layering**. By utilizing Right-to-Left (RTL) flow as a primary design driver rather than an afterthought, we create a rhythmic experience where information breathes. We reject the "boxed-in" look of standard Android apps in favor of fluid, stacked surfaces that guide the user’s eye through complex administrative tasks with ease and dignity.

---

## 2. Color & Surface Philosophy
The palette balances the energy of `primary` (Bright Orange) with the institutional trust of `secondary` (Royal Blue). 

### The "No-Line" Rule
**Explicit Instruction:** Prohibit the use of 1px solid borders for sectioning or containment. 
Boundaries must be defined solely through:
*   **Background Shifts:** Use `surface-container-low` sections sitting on a `surface` background.
*   **Tonal Transitions:** Defining edges through subtle contrast between `surface-container` tiers.

### Surface Hierarchy & Nesting
Treat the UI as physical layers of fine paper. 
*   **Base:** `surface` (#f8f9fa) acts as the canvas.
*   **Sections:** Use `surface-container-low` (#f3f4f5) for large groupings.
*   **Interactive Cards:** Use `surface-container-lowest` (#ffffff) to make high-priority self-service cards "pop" against the gray base.

### Glass & Gradient (The Signature Touch)
To avoid a "flat" government feel:
*   **Hero CTAs:** Apply a linear gradient from `primary` (#904d00) to `primary_container` (#ff8c00) at a 135-degree angle.
*   **Floating Navigation:** Use Glassmorphism on bottom navigation bars or floating action buttons (FABs). Utilize `surface` with 80% opacity and a `20px` backdrop-blur to allow content to bleed through softly.

---

## 3. Typography
We utilize a dual-font strategy to balance character with readability. For Arabic RTL environments, the focus is on "Optical Weight."

*   **Display & Headlines (`plusJakartaSans` / IBM Plex Sans Arabic Bold):** Used for large welcome messages and section titles. The high x-height conveys modernity and transparency.
*   **Body & Titles (`workSans` / Cairo):** Optimized for high legibility in dense administrative data.

**Hierarchy Note:** 
*   **Display-Lg (3.5rem):** Reserved for "Hero" numbers (e.g., "You have 2 pending requests").
*   **Headline-Sm (1.5rem):** Standard for card headings.
*   **Title-Md (1.125rem):** Used for input labels to ensure they are "relatively large" and accessible for all age groups.

---

## 4. Elevation & Depth
Depth in this system is "Ambient," not "Structural."

*   **The Layering Principle:** Stack `surface-container-lowest` (#ffffff) on top of `surface-container-low` (#f3f4f5) to create a natural lift. This mimics the way light hits layered documents.
*   **Ambient Shadows:** For floating elements (like a FAB or an active modal), use a high-diffusion shadow:
    *   *Y: 8px, Blur: 24px, Color: `on-surface` at 6% opacity.*
    *   This creates a soft glow rather than a harsh drop shadow.
*   **The "Ghost Border" Fallback:** If a border is required for accessibility, use `outline-variant` (#ddc1ae) at **15% opacity**. Never use a 100% opaque border.

---

## 5. Components & UI Patterns

### Buttons (The Anchor Points)
*   **Primary:** Uses the `primary_container` (#ff8c00). Shape: `xl` (1.5rem radius). No shadow; use a subtle internal glow (top-down white inner shadow at 10% opacity).
*   **Secondary:** `secondary` (#435b9f) with `on-secondary` (#ffffff) text. Use for "Support" or "View History" actions.
*   **Tertiary:** Text-only with an icon. For low-priority actions like "Cancel" or "Back."

### Large Expressive Cards
*   **Structure:** Forbid divider lines. Use **vertical white space (24px - 32px)** to separate headers from body text.
*   **Visuals:** Each card must feature a "Large, Colorful Icon" in the top-right corner (RTL). The icon should sit in a circular container using a 10% opacity version of its own color.
*   **Radius:** Always use `xl` (1.5rem) for main service cards to maintain a friendly, approachable feel.

### Input Fields (Administrative Clarity)
*   **Style:** No bottom-line-only inputs. Use a "Filled" style with `surface-container-high` (#e7e8e9) and a `md` (0.75rem) corner radius.
*   **Focus State:** Instead of a thick border, use a 2px outer glow of `primary` at 30% opacity.

### Self-Service Progress Indicators
*   **The "Citizen Path":** Use a vertical stepper for RTL. Completed steps use `primary`, while future steps use `surface-variant`. Avoid thin lines; use thick 4px rounded bars.

---

## 6. Do’s and Don’ts

### Do:
*   **Embrace White Space:** Allow at least 24px of padding on the sides of the screen. High-end apps feel expensive because they aren't "crowded."
*   **RTL Intentionality:** Ensure icons that indicate direction (arrows, progress) are mirrored. Brand-specific icons (logos) remain unmirrored.
*   **Vivid Icons:** Use multi-tonal icons (two-color) to align with the `primary` and `secondary` palette.

### Don’t:
*   **Don't use Dividers:** Avoid horizontal lines to separate list items. Use a `surface-container-lowest` card per item or a 12px gap between items.
*   **Don't use Black:** Never use pure #000000. Use `on-surface` (#191c1d) for text to maintain a professional, soft-contrast look.
*   **Don't use Small Targets:** Every interactive element must be at least 48dp in height to ensure the "Self-Service" aspect is frustration-free for all users.