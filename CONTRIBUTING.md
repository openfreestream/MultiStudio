# Contributing to MultiStudio

Thank you for your interest in contributing to **MultiStudio**!

MultiStudio is an open-source desktop application focused on live streaming, multistreaming, and extensible streaming workflows.

Our goal is to build a reliable, efficient, and approachable streaming studio with a modular architecture, modern user interface, and a strong developer ecosystem.

We welcome contributions from developers, designers, testers, translators, technical writers, and anyone interested in improving the project.

You do not need to be an experienced contributor to participate. Clear bug reports, documentation improvements, and well-tested fixes are valuable contributions.

## 1. Getting Started

Before contributing:

- Read the [Code of Conduct](CODE_OF_CONDUCT.md).
- Review the [Security Policy](SECURITY.md).
- Search existing GitHub issues and pull requests.
- Check whether your proposed change aligns with the project's goals.
- Discuss major architectural changes before implementation.
- Keep contributions focused and manageable.
- Never include secrets, credentials, or private information in commits.

For small bug fixes and documentation improvements, you can usually open a pull request directly.

For significant features, new dependencies, public APIs, or architectural changes, open an issue first.

### Good First Contributions

If you are new to MultiStudio, consider:

- Fixing small UI bugs.
- Improving error messages.
- Adding automated tests.
- Improving accessibility.
- Updating translations.
- Fixing compiler or QML lint warnings.
- Improving documentation.
- Reviewing existing issues.

Look for issues labeled `good first issue` or `help wanted`, if those labels are available.

## 2. Development Philosophy

MultiStudio follows several core engineering principles.

### Reliability First

Streaming software must behave predictably.

Changes should prioritize stability, resource management, and graceful error handling.

### Performance Matters

Media processing can be computationally expensive.

Avoid unnecessary memory allocations, blocking operations, excessive copying, and expensive work on the UI thread.

### Modularity

Keep application components focused and loosely coupled.

Prefer well-defined interfaces over tightly connected implementations.

### Security by Design

Treat external media, plugin code, network responses, and user-controlled input as potentially untrusted.

Never assume credentials or private configuration data can be safely exposed.

### Maintainability

Readable, well-structured code is preferable to unnecessarily complex implementations.

Optimize when there is a demonstrated need and a measurable benefit.

### Originality

MultiStudio should develop its own architecture, workflows, and user experience.

Contributors may learn from other streaming applications, but must not copy proprietary code, assets, or protected material without appropriate authorization and licensing.

## 3. Technology Stack

MultiStudio currently uses or plans to integrate:

| Technology        | Purpose                                   |
| ----------------- | ----------------------------------------- |
| C++20             | Core application and backend logic        |
| Qt 6.12           | Desktop application framework             |
| Qt Quick / QML    | User interface                            |
| Qt Quick Controls | Interface components                      |
| CMake             | Build configuration                       |
| Ninja             | Build system                              |
| MinGW             | Windows compiler toolchain                |
| FFmpeg            | Media processing and encoding integration |
| Python            | Test automation and planned plugin SDK    |
| pytest            | Automated testing                         |
| Qt Linguist       | Localization                              |
| GitHub Actions    | Continuous integration                    |

Some components are still under development. Do not assume a planned feature is already implemented.

Windows is the primary development environment. Support for other platforms may be added as the project evolves.

## 4. Development Environment

### Requirements

For the current Windows development workflow, install:

- Git
- CMake 3.24 or newer
- Ninja
- Qt 6.12 with a compatible MinGW kit
- Python 3.10 or newer
- pytest

Recommended tools:

- Visual Studio Code
- CMake Tools
- C/C++ extension
- Qt QML language support
- clang-format
- clang-tidy
- Qt Linguist

The current local development configuration uses Qt 6.12.0 and MinGW 13.1.

Ensure the compiler used by CMake is compatible with your Qt installation.

Avoid mixing incompatible compiler toolchains or Qt builds.

### Clone the Repository

Fork the official MultiStudio repository if you intend to submit changes from your own GitHub account.

Then clone your fork:

```powershell
git clone <your-fork-url>
cd <repository-directory>
```

Replace the placeholders with the actual repository URL and local directory name.

### Configure

From the project root:

```powershell
cmake --preset windows-mingw-debug
```

### Build

```powershell
cmake --build build/mingw-debug
```

### Run

```powershell
.\build\mingw-debug\MultiStudio.exe
```

The application may require Qt runtime libraries and plugins to be available in the environment.

### Clean Build

If you encounter stale CMake configuration or generated-file problems, remove the debug build directory:

```powershell
Remove-Item -Recurse -Force .\build\mingw-debug
```

Then configure and build again.

Do not commit generated build artifacts.

## 5. C++ Coding Standards

MultiStudio uses **C++20**.

### General Rules

- Use four spaces for indentation.
- Use descriptive names for classes, functions, and variables.
- Keep functions focused on one responsibility.
- Prefer `const` where appropriate.
- Prefer RAII for resource management.
- Avoid unnecessary raw owning pointers.
- Prefer standard library and Qt abstractions over manual resource management.
- Validate inputs and handle errors explicitly.
- Avoid hidden global state.
- Keep platform-specific behavior isolated.
- Avoid introducing dependencies without a clear technical reason.
- Document non-obvious behavior and important design decisions.

### Memory and Ownership

C++ code must handle memory and object ownership carefully.

- Follow Qt parent-child ownership conventions for `QObject` instances.
- Avoid dangling pointers and use-after-free conditions.
- Use smart pointers when appropriate.
- Ensure cleanup is deterministic.
- Consider thread affinity when working with Qt objects.
- Do not access UI objects from worker threads.

### Error Handling

Prefer meaningful error handling over silent failures.

- Validate assumptions.
- Return actionable error information where appropriate.
- Avoid swallowing exceptions without justification.
- Log enough information to diagnose failures.
- Never log secrets or credentials.
- Handle resource failures gracefully.

### Performance

When working on streaming or media-processing components:

- Avoid unnecessary copies of audio and video buffers.
- Keep expensive operations away from the UI thread.
- Avoid unbounded queues.
- Consider latency, memory usage, and CPU utilization.
- Measure performance before introducing complex optimizations.
- Include benchmark results when making significant performance claims.

## 6. Code Formatting and Static Analysis

MultiStudio uses clang-format for consistent C++ formatting.

Run formatting on modified C++ files:

```powershell
clang-format -i apps/desktop/src/main.cpp
```

Use the repository's `.clang-format` configuration.

If clang-tidy is installed, analyze modified C++ files with the generated compilation database:

```powershell
clang-tidy -p build/mingw-debug apps/desktop/src/main.cpp
```

The build must export `compile_commands.json` for compilation-database-based analysis.

The Qt MinGW toolchain and the clang-tidy toolchain may require additional configuration to work together correctly.

### Formatting Rules

- Do not reformat unrelated files.
- Avoid mixing large formatting changes with functional changes.
- Keep diffs focused.
- Resolve new warnings when practical.
- Explain intentional deviations from established conventions.

Static analysis is a development aid, not a replacement for testing or code review.

## 7. QML Development Guidelines

MultiStudio uses Qt Quick and QML for its desktop interface.

### Imports

Use Qt 6 unversioned imports:

```qml
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import MultiStudio.Theme
```

Only import modules that are actually required.

### Component Design

- Keep `Main.qml` focused on application composition and navigation.
- Create reusable components for repeated interface patterns.
- Separate large application panels into focused QML files.
- Avoid unnecessary duplication.
- Use descriptive property and signal names.
- Prefer explicit communication between components.
- Avoid deeply nested UI logic where simpler components would be clearer.

### Shared Theme

Use the shared `Theme` singleton for consistent styling.

Example:

```qml
Rectangle {
    color: Theme.surface
    radius: Theme.radiusMedium
}
```

Avoid introducing hardcoded colors or spacing values when a suitable theme property exists.

New theme properties should be named consistently and reused where appropriate.

### Layouts

Prefer Qt Quick Layouts for responsive interfaces.

- Use `RowLayout`, `ColumnLayout`, and related layout components.
- Use `Layout.*` properties for layout-managed items.
- Avoid conflicting anchors and layout geometry.
- Test resizing behavior.
- Consider text expansion caused by translations.

### Translations

All new user-visible strings should use `qsTr()`.

Example:

```qml
Label {
    text: qsTr("Start Streaming")
}
```

Avoid concatenating translated strings when a placeholder-based translation would be more reliable.

### Accessibility

Contributors should consider:

- Keyboard navigation.
- Focus visibility.
- Readable text.
- Sufficient contrast.
- Accessible labels for icon-only controls.
- Clear feedback for errors and disabled actions.

### QML Linting

After configuring the project, run:

```powershell
cmake --build build/mingw-debug --target MultiStudio_qmllint
```

If the lint target is unavailable in a particular configuration, use the appropriate Qt `qmllint` executable and configured import paths.

Do not suppress warnings without understanding their cause.

## 8. UI and Backend Architecture

Keep presentation logic separate from core application functionality.

### QML Responsibilities

QML should primarily handle:

- Interface presentation.
- User interaction.
- Visual state.
- Navigation.
- UI-specific animations.
- Displaying backend data.

### C++ Responsibilities

C++ should handle substantial application functionality such as:

- Persistent application state.
- Scene and source management.
- Media processing.
- Encoding and streaming.
- Resource management.
- Network operations.
- Plugin management.
- Application services.

Temporary QML models may be used during prototyping.

When implementing production functionality, avoid duplicating important application state across unrelated QML components.

Prefer clear interfaces between the frontend and backend.

## 9. FFmpeg and Media Processing

FFmpeg integration is an important planned part of MultiStudio.

Contributors working on media functionality should:

- Validate media inputs.
- Handle malformed and unsupported formats gracefully.
- Release FFmpeg resources correctly.
- Avoid memory leaks and unbounded buffering.
- Consider audio/video synchronization.
- Handle encoder and decoder failures.
- Avoid blocking the UI thread.
- Document hardware-specific assumptions.
- Test with multiple supported media formats where practical.

### Performance Contributions

Performance-related pull requests should include useful measurements when possible.

Describe:

- The environment used.
- The workload.
- The previous behavior.
- The new behavior.
- The measurement method.
- Any tradeoffs.

Do not claim a performance improvement based only on intuition.

## 10. Plugin Development Guidelines

MultiStudio plans to provide an extensible plugin system, including installation from Git repositories and support for plugin SDKs.

The plugin API and security model are still subject to development.

### General Principles

Plugin-related contributions should prioritize:

- Stable and clearly defined interfaces.
- Explicit plugin metadata.
- Version compatibility.
- Predictable lifecycle management.
- Error isolation where technically feasible.
- Clear permission and trust boundaries.
- Secure installation and update behavior.
- Maintainable SDKs and documentation.

### Security Considerations

Third-party plugins may execute code or interact with sensitive application functionality.

Contributors must not assume plugin code is trustworthy.

Plugin designs should consider:

- Source verification.
- Dependency integrity.
- Credential access.
- File system access.
- Network permissions.
- Plugin installation and removal.
- Compatibility checks.
- Failure recovery.
- Clear warnings for untrusted plugins.

Do not describe plugins as sandboxed unless an actual isolation mechanism has been implemented and verified.

### Plugin API Changes

Before introducing or changing public plugin APIs:

1. Open a design discussion or issue.
2. Explain the intended use case.
3. Describe compatibility implications.
4. Consider security boundaries.
5. Provide example usage where appropriate.
6. Document any migration requirements.

Avoid introducing breaking API changes without discussion.

## 11. Python Testing

MultiStudio uses Python and pytest for automated testing.

### Install Test Dependencies

```powershell
python -m pip install -r tests/requirements.txt
```

### Run Tests

```powershell
python -m pytest tests/ -v
```

### Test Guidelines

Tests should:

- Be deterministic.
- Have descriptive names.
- Avoid relying on external services unless necessary.
- Use temporary files and directories.
- Avoid modifying developer data.
- Clean up generated resources.
- Include meaningful assertions.
- Cover relevant edge cases.
- Avoid real credentials.
- Be practical to run locally and in CI.

Use pytest fixtures for reusable test setup.

### Regression Tests

When fixing a bug, add a regression test where practical.

A useful regression test should fail for the original defect and pass after the fix.

If a bug cannot reasonably be covered by automation, explain the manual verification procedure in the pull request.

## 12. Translation Contributions

MultiStudio uses Qt Linguist for localization.

Translation files use the Qt `.ts` XML format.

### Guidelines

- Preserve placeholders such as `%1`, `%2`, and `%n`.
- Maintain the meaning of the source text.
- Use consistent terminology.
- Preserve necessary formatting.
- Avoid unnecessary changes to unrelated translations.
- Check XML validity.
- Prefer natural language over overly literal translation.
- Consider interface space limitations.

New interface strings should be marked with `qsTr()`.

Translation changes should be tested in the application where practical.

## 13. Icons and Third-Party Assets

MultiStudio uses SVG icons, including icons from the Lucide icon set.

When adding assets:

- Use consistent dimensions and visual style.
- Prefer scalable formats where appropriate.
- Use descriptive filenames.
- Avoid duplicates.
- Confirm license compatibility.
- Preserve required copyright notices and attribution.
- Update resource configuration as needed.

Do not copy proprietary icons, branding, or other protected assets without permission.

## 14. Adding Dependencies

New dependencies increase maintenance, security, and compatibility responsibilities.

Before adding a dependency, consider:

- Is it necessary?
- Can existing Qt, C++, or project functionality solve the problem?
- Is the dependency actively maintained?
- Is its license compatible with the project's chosen license?
- Does it support the required platforms and toolchains?
- Does it introduce security concerns?
- Does it significantly increase build or distribution complexity?

Discuss substantial new dependencies before introducing them.

Document new dependencies and their licensing requirements.

## 15. Reporting Bugs

Use the repository's **Bug Report** issue template.

A good bug report includes:

- MultiStudio version or commit.
- Operating system.
- Affected component.
- Steps to reproduce.
- Expected behavior.
- Actual behavior.
- Relevant sanitized logs.
- Screenshots or recordings when useful.

Search for existing reports before opening a duplicate.

Security vulnerabilities must be reported privately according to [SECURITY.md](SECURITY.md).

## 16. Proposing Features

Use the repository's **Feature Request** issue template.

A strong proposal explains:

- The problem being solved.
- Why the feature matters.
- The expected behavior.
- Potential alternatives.
- Relevant technical constraints.
- Possible effects on performance, security, and usability.

Large features should be discussed before implementation.

A feature request does not guarantee acceptance or implementation.

## 17. Branch Naming

Create a separate branch for each focused change.

Recommended examples:

```text
feature/scene-management
fix/qml-imports
docs/security-policy
test/translation-validation
refactor/media-backend
build/cmake-improvements
```

Create a branch with:

```powershell
git switch -c feature/scene-management
```

Avoid combining unrelated features and fixes in one branch.

## 18. Commit Messages

Use concise, meaningful commit messages.

Recommended format:

```text
type: short description
```

Examples:

```text
feat: add scene selection support
fix: resolve QML import warnings
docs: improve contributing guidelines
test: add translation validation
refactor: simplify source management
build: improve CMake configuration
security: validate plugin metadata
```

Suggested types:

- `feat` — New functionality.
- `fix` — Bug fixes.
- `docs` — Documentation.
- `test` — Tests.
- `refactor` — Internal restructuring.
- `build` — Build configuration.
- `security` — Security improvements.
- `chore` — Maintenance.

These conventions are recommended but are not currently described as enforced by automation.

## 19. Pull Request Guidelines

Pull requests should be focused, understandable, and reviewable.

### Before Opening a Pull Request

1. Ensure your branch is up to date with the target branch.
2. Review your changes.
3. Remove temporary debugging code.
4. Format modified C++ files.
5. Build the application.
6. Run relevant automated tests.
7. Run QML linting when applicable.
8. Update documentation and translations.
9. Check for accidental secret exposure.
10. Complete the pull request template.

### Pull Request Description

Explain:

- What changed.
- Why the change is needed.
- Which issue it addresses, if applicable.
- How the change was tested.
- Any known limitations.
- Any compatibility concerns.

Include screenshots or recordings for significant UI changes.

### Pull Request Checklist

- [ ] The change has a clear purpose.
- [ ] The code follows established conventions.
- [ ] Relevant tests pass, or limitations are explained.
- [ ] New functionality has appropriate test coverage.
- [ ] C++ formatting has been checked.
- [ ] QML linting has been performed where applicable.
- [ ] User-visible strings are translatable.
- [ ] Documentation has been updated where necessary.
- [ ] No credentials or generated build files are included.
- [ ] Security and performance implications have been considered.

### Review Expectations

Maintainers may request changes before merging.

Respond constructively to review feedback and explain technical decisions when necessary.

Do not resolve review discussions without addressing the underlying concern or explaining the decision.

## 20. Continuous Integration

GitHub Actions is intended to provide automated checks for MultiStudio.

Depending on the configured workflows, these may include:

- CMake configuration.
- Windows builds.
- QML linting.
- Python pytest tests.
- Additional static analysis.

Contributors should review CI results and resolve failures introduced by their changes.

If a check cannot run because of an infrastructure or configuration limitation, explain the situation in the pull request.

Passing CI does not guarantee that a change is free of defects.

## 21. Documentation Standards

Documentation should be accurate, clear, and maintainable.

Contributors should:

- Use clear English.
- Keep instructions aligned with implemented functionality.
- Provide reproducible commands.
- Avoid claiming unfinished features are available.
- Explain non-obvious setup requirements.
- Keep examples realistic.
- Update related documentation when behavior changes.
- Preserve useful links and references.

Documentation-only contributions are welcome.

## 22. Security Requirements

All contributors must follow the project's [Security Policy](SECURITY.md).

In particular:

- Never commit secrets.
- Treat external inputs as untrusted.
- Protect streaming credentials.
- Validate file paths and network endpoints.
- Use secure transport where supported.
- Avoid disabling TLS certificate verification.
- Review plugin trust boundaries.
- Keep dependencies maintained.
- Consider memory safety in native code.
- Add security regression tests where practical.

Do not publish details of an unpatched vulnerability in a public pull request or issue.

Coordinate sensitive fixes privately with maintainers.

## 23. Licensing and Intellectual Property

By submitting a contribution, you confirm that you have the right to submit the contributed code, documentation, or assets under the project's applicable license.

Contributors must:

- Respect third-party licenses.
- Preserve required copyright notices.
- Avoid copying incompatible proprietary material.
- Identify externally sourced code or assets.
- Document third-party attribution requirements.
- Discuss licensing concerns before introducing new dependencies.

The project's actual licensing terms are defined by its `LICENSE` file.

Do not assume that a particular open-source license has been selected until it is published.

## 24. Community and Communication

All contributors must follow the [Code of Conduct](CODE_OF_CONDUCT.md).

We encourage:

- Respectful technical discussion.
- Constructive feedback.
- Clear explanations.
- Patience with new contributors.
- Evidence-based decisions.
- Collaboration across experience levels.

Disagreements are normal in software development.

Focus on the technical merits of proposals rather than personal criticism.

## 25. Getting Help

If you need help contributing:

- Read the project README and available documentation.
- Search existing issues.
- Review related pull requests.
- Ask focused technical questions.
- Use GitHub Discussions if enabled.
- Provide relevant logs and environment details when requesting assistance.

Do not share passwords, tokens, or stream keys when asking for help.

## 26. Maintainer Decisions

Maintainers are responsible for protecting the project's technical direction, maintainability, and community standards.

They may:

- Request changes.
- Ask for additional tests.
- Request documentation.
- Postpone a proposal.
- Reject changes that conflict with project goals.
- Close duplicate or outdated issues.
- Decline changes that introduce unacceptable security or maintenance risks.

Contributions are evaluated based on project needs and technical merit.

Submission does not guarantee acceptance.

## 27. Final Contribution Checklist

Before submitting your contribution, verify the following:

- [ ] I understand the purpose of my changes.
- [ ] I have checked for related issues or pull requests.
- [ ] I have followed the project's coding conventions.
- [ ] I have tested the affected functionality.
- [ ] I have updated relevant tests and documentation.
- [ ] I have considered security and performance.
- [ ] I have not included sensitive information.
- [ ] I have respected applicable licenses.
- [ ] I have completed the pull request template.

## 28. Thank You

MultiStudio is built through experimentation, collaboration, and continuous improvement.

Every well-considered contribution helps move the project forward.

Whether you improve the codebase, report a bug, add tests, translate the interface, or refine documentation, your work is valued.

**Thank you for contributing to MultiStudio!**
