Contributing to MultiStudio

Thank you for your interest in contributing to MultiStudio!

MultiStudio is an open-source desktop application focused on live streaming, multistreaming, media management, and an accessible streaming workflow.

We welcome contributions from developers, designers, testers, translators, technical writers, and community members.

Whether you are fixing a bug, improving the user interface, adding tests, or updating documentation, your contribution is appreciated.

1. Before You Start

Before contributing, please:

- Read our "Code of Conduct" (CODE_OF_CONDUCT.md).
- Review the "Security Policy" (SECURITY.md).
- Search existing GitHub issues and pull requests.
- Open an issue to discuss substantial new features or architectural changes.
- Keep contributions focused and reasonably sized.
- Never commit passwords, API tokens, stream keys, or other sensitive information.

Security vulnerabilities must be reported privately according to "SECURITY.md", not through public issues.

2. Technology Stack

MultiStudio uses the following technologies:

Technology| Purpose
C++20| Application logic and backend
Qt 6.12| Cross-platform application framework
Qt Quick / QML| Desktop user interface
Qt Quick Controls| Reusable UI controls
CMake| Build configuration
Ninja| Build system
MinGW| Windows C++ compiler
FFmpeg| Optional media-processing backend
Python| Test automation
pytest| Python testing framework
Qt Linguist| Application translations
GitHub Actions| Continuous integration

Windows is the primary development platform during the early stages of the project.

Linux and macOS support may be developed in the future.

3. Development Requirements

For Windows development, install:

- Git
- CMake 3.24 or newer
- Ninja
- Qt 6.12 with the MinGW kit
- A compatible MinGW compiler
- Python 3.10 or newer
- pytest

Recommended development tools:

- Visual Studio Code
- CMake Tools extension
- C/C++ extension
- Qt QML language support
- Qt Linguist

The project currently uses Qt 6.12.0 with MinGW 13.1 in its local Windows development configuration.

FFmpeg development libraries are optional for initial UI development. Features requiring the streaming backend will not be available without the necessary media libraries.

4. Repository Structure

The repository is organized as follows:

MultiStudio/
├── .github/
│   ├── ISSUE_TEMPLATE/
│   ├── workflows/
│   └── PULL_REQUEST_TEMPLATE.md
├── apps/
│   └── desktop/
│       ├── src/
│       ├── qml/
│       │   ├── components/
│       │   ├── panels/
│       │   └── theme/
│       └── assets/
│           └── icons/
├── benchmark/
├── tests/
├── tools/
│   └── scripts/
├── translations/
├── CMakeLists.txt
├── CMakePresets.json
├── README.md
├── SECURITY.md
├── CODE_OF_CONDUCT.md
└── CONTRIBUTING.md

Directory Responsibilities

"apps/desktop/src/"

Contains the C++ application entry point and desktop-specific backend code.

"apps/desktop/qml/"

Contains the Qt Quick user interface.

"apps/desktop/qml/components/"

Contains reusable QML components, including navigation and sidebar elements.

"apps/desktop/qml/panels/"

Contains application panels such as preview, scenes, sources, audio controls, and application information.

"apps/desktop/qml/theme/"

Contains shared visual design properties, including colors, spacing, and corner radii.

"apps/desktop/assets/icons/"

Contains SVG icons used by the application.

"benchmark/"

Contains standalone performance benchmarks.

"tests/"

Contains automated tests, including Python tests using pytest.

"tools/scripts/"

Contains development and maintenance scripts.

"translations/"

Contains Qt Linguist translation files.

5. Getting the Source Code

Clone the repository using its official GitHub URL:

git clone <repository-url>
cd <repository-directory>

Replace the placeholders with the actual repository URL and directory.

If you are contributing through a fork, fork the repository on GitHub first and clone your fork.

6. Building on Windows

The following commands assume that Qt, CMake, Ninja, and MinGW have been installed and that the required tools are available to CMake.

Configure

From the project root:

cmake --preset windows-mingw-debug

Build

cmake --build build/mingw-debug

Run

.\build\mingw-debug\MultiStudio.exe

The executable may require Qt runtime libraries and plugins to be available through the development environment or a properly deployed application directory.

Clean Build

To remove the existing debug build directory:

Remove-Item -Recurse -Force .\build\mingw-debug

Then configure and build the project again.

Do not commit generated build files.

7. C++ Coding Guidelines

MultiStudio uses C++20.

Contributors should follow these guidelines:

- Use four spaces for indentation.
- Prefer clear, descriptive names.
- Keep functions focused on a single responsibility.
- Prefer RAII and automatic resource management.
- Avoid unnecessary raw owning pointers.
- Use Qt ownership conventions appropriately for QObject-based classes.
- Validate inputs and handle errors explicitly.
- Avoid unnecessary global state.
- Do not block the UI thread with expensive operations.
- Keep platform-specific code isolated when practical.
- Document complex or non-obvious behavior.
- Avoid introducing dependencies without a clear reason.

Example

#include <QString>

QString formatSceneName(const QString &name)
{
    return name.trimmed();
}

Follow the surrounding code's established conventions when editing existing files.

8. QML Coding Guidelines

MultiStudio uses Qt 6.12 and Qt Quick.

Imports

Use unversioned Qt 6 imports:

import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import MultiStudio.Theme

Avoid unnecessary imports.

Component Organization

Keep "Main.qml" focused on the main application window and navigation.

Place reusable UI elements in "components/".

Place larger application sections in "panels/".

Avoid placing the entire application interface in one large QML file.

Theme

Use the shared "Theme" singleton for application colors, spacing, and visual consistency.

Example:

Rectangle {
    color: Theme.surface
    radius: Theme.radiusMedium
}

Avoid hardcoding colors that already exist in the shared theme.

Layouts

Prefer "RowLayout", "ColumnLayout", and other Qt Quick Layouts for responsive interfaces.

Use "Layout.*" properties for items managed by a layout.

Do not use anchors and layout geometry properties to control the same item's position or size.

Translations

Wrap user-visible strings in "qsTr()":

Label {
    text: qsTr("Settings")
}

UI and Backend Separation

QML should primarily handle presentation and user interaction.

Use C++ for persistent application state, media processing, streaming operations, and other substantial backend functionality.

Simple temporary QML models are acceptable during prototyping.

Production data models should be implemented in the appropriate backend layer when persistence or shared state is required.

QML Linting

Run:

cmake --build build/mingw-debug --target MultiStudio_qmllint

Address new warnings where practical.

Do not suppress diagnostics without understanding their cause.

9. Python Testing Guidelines

MultiStudio uses Python and pytest for automated testing.

Tests are located in "tests/".

Install Dependencies

python -m pip install -r tests/requirements.txt

Run Tests

python -m pytest tests/ -v

Test Organization

Use descriptive filenames beginning with "test_".

Examples:

- "test_build.py"
- "test_qml.py"
- "test_translations.py"
- "test_resources.py"

Place shared pytest fixtures in "tests/conftest.py".

Writing Tests

Tests should:

- Be deterministic whenever possible.
- Avoid depending on external services unless explicitly required.
- Use temporary directories for generated test data.
- Avoid modifying user files.
- Clean up resources after execution.
- Provide meaningful assertion messages.
- Cover relevant error conditions.

New functionality should include appropriate tests where feasible.

10. Translation Contributions

MultiStudio uses Qt Linguist.

Translation files are located in:

translations/

Example:

multistudio_cs.ts
multistudio_de.ts
multistudio_es.ts
multistudio_fr.ts
multistudio_pl.ts

These ".ts" files use the Qt Linguist XML format and are not TypeScript files.

Translation Guidelines

- Preserve placeholders such as "%1" and "%2".
- Maintain the intended meaning of the original text.
- Use consistent terminology.
- Avoid unnecessary changes to source strings.
- Check translations for readability and clarity.
- Ensure XML remains valid.
- Prefer Qt Linguist for editing translation files.

New user-visible strings should be marked with "qsTr()".

Translation files can be compiled into ".qm" files as part of the configured Qt translation build process.

11. Icons and Assets

MultiStudio uses SVG icons, including icons from the Lucide icon set.

Icons are stored in:

apps/desktop/assets/icons/

Guidelines:

- Prefer consistent icon dimensions and visual style.
- Use SVG where appropriate.
- Keep asset names descriptive.
- Avoid duplicate or unused assets.
- Ensure contributed assets have compatible licenses.
- Update the relevant CMake resource configuration when adding new icons.

Do not add copyrighted assets without appropriate permission or licensing.

12. Reporting Bugs

Before reporting a bug:

1. Check existing GitHub issues.
2. Confirm the problem is reproducible.
3. Collect relevant error messages.
4. Identify the affected application version.
5. Remove sensitive information from logs and screenshots.

Use the repository's Bug Report issue template.

Include reproduction steps, expected behavior, actual behavior, and relevant environment details.

Do not report security vulnerabilities publicly.

13. Suggesting Features

We welcome ideas for improving MultiStudio.

Use the Feature Request issue template.

A useful feature request should explain:

- The problem or limitation.
- The proposed behavior.
- The expected user benefit.
- Any relevant alternatives.
- Examples or mockups, if available.

For large changes, discuss the proposal before beginning implementation.

14. Creating a Branch

Create a separate branch for your work.

Recommended naming patterns:

feature/scene-management
fix/qml-imports
docs/contributing-guide
test/translation-validation
refactor/audio-backend

Example:

git switch -c feature/scene-management

Keep unrelated changes in separate branches and pull requests.

15. Commit Messages

Use clear, descriptive commit messages.

Recommended format:

type: short description

Examples:

feat: add scene management panel
fix: resolve QML import warnings
docs: add contributing guidelines
test: validate translation files
refactor: simplify source model
build: update CMake configuration

Suggested types include:

- "feat"
- "fix"
- "docs"
- "test"
- "refactor"
- "build"
- "chore"

This convention is recommended rather than strictly enforced.

16. Submitting a Pull Request

Before submitting a pull request:

1. Update your branch with the target branch.
2. Review your changes.
3. Remove temporary debugging code.
4. Build the application.
5. Run relevant tests.
6. Run QML linting when applicable.
7. Update documentation and translations if needed.
8. Check for accidentally committed secrets.
9. Complete the pull request template.

Pull Request Checklist

- [ ] The change has a clear purpose.
- [ ] The code follows project conventions.
- [ ] Relevant tests pass or limitations are explained.
- [ ] QML changes have been linted where applicable.
- [ ] Documentation has been updated if needed.
- [ ] New user-visible strings are translatable.
- [ ] No secrets or generated build files are included.
- [ ] UI changes include screenshots when useful.

Maintainers may request revisions before merging.

17. Continuous Integration

MultiStudio uses GitHub Actions for automated project checks.

The intended CI workflow includes:

- CMake configuration.
- Windows application builds.
- QML linting.
- Python pytest tests.

Contributors should review CI results and resolve relevant failures before requesting a merge.

CI coverage may expand as the project develops.

18. Security Guidelines

Streaming applications may handle sensitive credentials, including stream keys and authentication tokens.

Contributors must:

- Never commit real credentials.
- Never expose credentials in application logs.
- Avoid storing secrets in plain text.
- Validate untrusted inputs.
- Use secure network communication where supported.
- Handle media files and external data carefully.
- Keep third-party dependencies updated.
- Review security implications of new functionality.

Report vulnerabilities privately according to "SECURITY.md" (SECURITY.md).

19. Documentation Contributions

Documentation improvements are welcome.

When editing documentation:

- Use clear and understandable English.
- Keep instructions consistent with the current implementation.
- Include commands that can be reproduced.
- Avoid documenting unfinished functionality as complete.
- Use Markdown formatting consistently.
- Update related documentation when behavior changes.

Examples and screenshots should accurately represent MultiStudio.

20. Review Process

Pull requests may be reviewed for:

- Correctness.
- Maintainability.
- Security.
- Performance.
- Compatibility.
- Test coverage.
- User experience.
- Documentation quality.
- Consistency with the project architecture.

Not every contribution will be merged.

Maintainers may request changes, postpone a feature, or decline a proposal based on project priorities and technical considerations.

21. Community Standards

All contributors must follow the "Code of Conduct" (CODE_OF_CONDUCT.md).

We encourage respectful technical discussions, constructive feedback, and collaboration.

Disagreements should focus on code, design, and evidence rather than individuals.

22. Getting Help

If you need assistance:

- Review the project README.
- Search existing issues.
- Check available documentation.
- Open a GitHub Discussion if the repository has Discussions enabled.
- Ask a focused question in an appropriate project issue.

Please provide relevant technical details when requesting help.

23. Thank You

Every contribution helps improve MultiStudio.

Whether you contribute code, tests, translations, documentation, design ideas, or bug reports, your effort helps move the project forward.

Thank you for contributing to MultiStudio!
