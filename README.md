<br>
<div align="center">

# spec-fab: Conflict-Driven Specifications
[![GitHub stars](https://img.shields.io/github/stars/stephen9412/spec-fab?style=social)](https://github.com/stephen9412/spec-fab/stargazers)
[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](https://opensource.org/licenses/MIT)
[![繁體中文](https://img.shields.io/badge/DOCS-繁體中文-blue)](./README_zh-TW.md)

</div>
<br>

> 🛑 **Stop chatting. Start merging.**
> 
> Forces LLM integration directly into your Unix pipeline, treating **architectural decisions** as **Git merge conflicts**—requiring you, the human, to resolve them.
> 
> ---
> ⭐️ **GitHub newbie here. Your Star gives me enough motivation to skip dinner and code for 2 more hours.**

![Demo](.github/assets/output.gif)

## ⚡️ TL;DR

**It's like spec-kit, but native to your Terminal.**

```bash
# 1. Install
curl -sLf https://raw.githubusercontent.com/stephen9412/spec-fab/refs/heads/main/install.sh | sh

# 2. Init
mkdir my-project && cd my-project
spec_init

# 3. Constitution
spec_constitution "Principles: Rust, Clean Code, Zero-Cost Abstractions"

# 4. Drafting - Unleash the Power of Unix Pipes!
echo "Build a Tinder-like app for adopting cats" | spec_new
# 💥 Spec Conflicts! AI found ambiguities in your requirements. Open spec.md to resolve them.

# 5. Architecting
spec_plan
# 💥 Architecture Conflicts! AI provided different implementation strategies. Open plan.md to pick your tactics.
```

---

## Why Choose spec-fab?

> **The Unix-Philosophy alternative to Spec-Kit.**

We threw out all the **bloated dependencies**.
❌ No Ruby required
❌ No Node.js required
❌ No complex state machines

We kept only the essentials:
✅ **Fish Shell** (Flow Control)
✅ **Fabric AI** (The Brain)
✅ **Vim / Your Editor** (The Decision Maker)

* **⚡️ Blazing Fast**: It's just Shell Functions. It installs faster than you can type `npm install`.
* **🧠 AI Native**: Powered by [Fabric](https://github.com/danielmiessler/Fabric) for architectural brainstorming and review.
* **📄 Pure Markdown**: Your documentation is plain text. No hidden databases, no black magic.
* **🤝 Spec-Kit Compatible**: We adopt the best practices and prompt logic from GitHub's official [spec-kit](https://github.com/github/spec-kit), but implemented for the command line.


---

## 🎭 Origin Story: A Lesson in Irony

> **"This is exactly why this project exists."**

Ironically, when I was first developing SpecFab, I tried to use the "ultimate stack"—**OpenCode + Claude 3.7 Sonnet**—to run **Spec-kit**'s official commands, just to generate a basic template for cross-validation.

The result? That "high-tech" combo kept erroring out, leaving me staring at my screen, **questioning my life choices.**

That was my epiphany: **We shouldn't be wrestling with TUIs or debugging complex dependency trees just to capture a flash of inspiration.** We need tools that are simpler, more brutal, and won't betray us.

And so, `spec-fab` was born.

---

## 🚀 Installation

One command. Upgrade your Terminal to an architect's arsenal in 30 seconds.

```bash
curl -sLf https://raw.githubusercontent.com/stephen9412/spec-fab/refs/heads/main/install.sh | sh
```

### 🧹 Uninstallation (The "Clean Break" Promise)

We respect your system hygiene (I'm a clean freak too). spec-fab is disciplined: all core files stay strictly within `~/.specfab`.

If you decide to leave, we provide a **`spec_uninstall`** command (nuclear option) that wipes spec-fab and its shell hooks instantly.

**Our "Do No Harm" Policy:**

* We **won't** delete your `fish` shell (it might be your default).
* We **won't** delete `~/.config/fabric` (you might have used Fabric before us, and we won't touch your API keys).

**The Promise:**

1. Run `spec_uninstall` (Auto-clean).
2. Or manually `rm -rf ~/.specfab` (Simple & brutal).
3. Your shell config and AI keys remain 100% untouched.

---

## 🛠 Usage

### 1. Initialize (`spec_init`)

Don't let your project run naked.

```bash
spec_init
# ✅ Created Constitution: .specify/memory/constitution.md
# ✅ Created Spec Template: .specify/templates/spec-template.md
# ...
# 🚀 spec-fab environment ready.
```

### 2. Set Principles (`spec_constitution`)

Tell the AI your rules. Pipe in a doc or give a direct command.

```bash
# Pipe mode: Feed a draft
cat draft.md | spec_constitution

# Argument mode: Issue a supreme directive
spec_constitution "Create principles focused on code quality, testing standards, and Rust idioms."
```

### 3. Create Spec (`spec_new`)

Where the magic happens. Give it an idea; get a Git branch and a drafted spec.

```bash
cat prd.md | spec_new
# 📥 Reading description...
# 🏷  Slug generated: build-faceswap-pipeline
# 🌿 Git branch created: 1-build-faceswap-pipeline
# 🏗  Drafting Specification...
# 🔍 Refining Spec quality...
# ✅ Spec Created at: specs/1-build-faceswap-pipeline/spec.md
```

### 4. Generate Plan (`spec_plan`)

The AI Architect analyzes your spec and drafts a technical plan. **If it finds uncertainty, it deliberately creates Git conflicts for you to resolve.**

```bash
spec_plan
# 🚀 Generating Technical Plan...
# 🧠 Architecting solution...
# 💥 CONFLICTS DETECTED! The Architect presented options.
#    Please open the file and resolve the merge conflicts.
#    (You decide the architecture. Don't let AI hallucinate your system.)
```

### 9. Language & Translation Workflow

spec-fab supports multi-language documentation natively using Fabric's `LANGUAGE_OUTPUT` setting.

#### Toggle Language
Switch the AI's output language globally (e.g., between English and your Native Locale).

```bash
# Toggle between en-US and your native language (set in config)
spec_toggle_lang
# Output: 🌐 Fabric output switched to Native: zh-TW

# Toggle back
spec_toggle_lang
# Output: 🇺🇸 Fabric output reset to Default: en-US

```

#### Translate Documents

Translate any existing specification or plan into the currently selected language.
*Uses the `translate_tech` pattern to ensure technical terms (e.g., Kubernetes, React) remain in English.*

```bash
# Standard usage (uses current global language setting)
spec_translate spec.md
# 咻! spec.md is now in Traditional Chinese.

# One-off override (without changing global config)
LANGUAGE_OUTPUT=ja-JP spec_translate plan.md
# 咻! plan.md is now in Japanese.


## 🚧 Roadmap

The journey of SpecFab has just begun. We are working on the final pieces to bridge the gap from "Decision" to "Execution":

| Command |
| :--- |
| **`spec_task`** |
| **`spec_checklist`** |
| **`spec_summarize_spec`** |
| **`spec_summarize_plan`** |

## Contributing

We welcome community contributions! SpecFab believes that "Small is Beautiful."

### How You Can Help

1. **Optimize Patterns (`patterns/`)**: The AI's brain is in the Prompts. If you find better prompts for rigorous specs, submit a PR.
2. **Improve Fish Functions**: We chase performance and readability. Better code is always welcome.
3. **Docs & Examples**: Help us improve the README.

### Development Principles

* **Keep Dependencies Minimal**: Avoid heavy runtimes like Python, Node, or Ruby inside the core. We want to run on just `fish`, `curl`, `git`, and `fabric`.
* **Unix Philosophy**: Functions should do one thing well and support Piping (`|`).
* *Note:* We are open to adding tools like `gum` later for better UX (for **visual learners** or quick selections), but core functionality must remain pipe-friendly.



### Steps

1. Fork it.
2. Create your branch (`git checkout -b feature/AmazingFeature`).
3. Commit (Conventional Commits preferred).
4. Push and Open PR.

## Acknowledgments

* **[Fabric](https://github.com/danielmiessler/Fabric)**: Thanks to Daniel Miessler for making AI in the terminal elegant. SpecFab wouldn't exist without this engine.
* **[spec-kit](https://github.com/github/spec-kit)**: Thanks to the GitHub team. Their methodology and prompt logic inspired the core of SpecFab. We stand on the shoulders of giants to bring this philosophy to the CLI.
