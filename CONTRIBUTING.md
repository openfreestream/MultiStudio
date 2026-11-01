Contributing to MultiStudio

Thank you for your interest in contributing to MultiStudio!

MultiStudio is an open-source desktop application focused on live streaming, multistreaming, media management, and a user-friendly streaming workflow.

We welcome contributions from developers, designers, testers, translators, technical writers, and community members.

Whether you are fixing a bug, improving the user interface, adding tests, or updating documentation, your contribution is appreciated.

1. Before You Start

Before contributing, please:

- Read our "Code of Conduct" (CODE_OF_CONDUCT.md).
- Review our "Security Policy" (SECURITY.md).
- Search existing GitHub issues and pull requests.
- Discuss substantial features or architectural changes before implementation.
- Keep contributions focused and reasonably sized.
- Never commit passwords, API tokens, stream keys, or other sensitive information.

Security vulnerabilities must be reported privately according to "SECURITY.md", not through public issues.

2. Technology Stack

MultiStudio uses the following technologies:

Technology| Purpose
C++20| Application logic and backend
Qt 6.12| Application framework
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

The local Windows development configuration currently uses Qt 6.12.0 and MinGW 13.1.

FFmpeg development libraries are optional for initial UI development. Features requiring media processing will need the appropriate backend dependencies.

4. Getting the Source Code

Clone the official repository:

git clone <repository-url>
cd <repository-directory>

Replace the placeholders with the actual repository URL and directory name.

If you are contributing through a fork, fork the repository on GitHub before cloning your copy.

5. Building on Windows

Ensure Qt, CMake, Ninja, and MinGW are installed and correctly configured.

Configure

Run the following command from the project root:

cmake --preset windows-mingw-debug

Build

cmake --build build/mingw-debug

Run

.\build\mingw-debug\MultiStudio.exe

The application may require Qt runtime libraries and plugins to be available through the development environment or a properly deployed application directory.

Clean Build

To remove the existing debug build directory:

Remove-Item -Recurse -Force .\build\mingw-debug

Then configure and build the project again.

Do not commit generated build files.

6. C++ Coding Guidelines

MultiStudio uses C++20.

Contributors should follow these guidelines:

- Use four spaces for indentation.
- Prefer clear and descriptive names.
- Keep functions focused on a single responsibility.
- Prefer RAII and automatic resource management.
- Avoid unnecessary raw owning pointers.
- Follow Qt ownership conventions for QObject-based classes.
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

7. QML Coding Guidelines

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

Place reusable interface elements in QML components.

Keep application panels separate rather than placing the entire interface in one large file.

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

Use "Layout.*" properties for items managed by layouts.

Do not combine anchors and layout geometry properties to control the same item's position or size.

Translations

Wrap user-visible strings in "qsTr()":

Label {
    text: qsTr("Settings")
}

UI and Backend Separation

QML should primarily handle presentation and user interaction.

Use C++ for persistent application state, media processing, streaming operations, and substantial backend functionality.

Simple temporary QML models are acceptable during prototyping.

Production data models should use the appropriate backend layer when persistence or shared state is required.

QML Linting

Run:

cmake --build build/mingw-debug --target MultiStudio_qmllint

Address new warnings where practical.

Do not suppress diagnostics without understanding their cause.

8. Python Testing Guidelines

MultiStudio uses Python and pytest for automated testing.

Install Dependencies

python -m pip install -r tests/requirements.txt

Run Tests

python -m pytest tests/ -v

Writing Tests

Tests should:

- Be deterministic whenever possible.
- Avoid depending on external services unless explicitly required.
- Use temporary directories for generated test data.
- Avoid modifying user files.
- Clean up resources after execution.
- Provide meaningful assertion messages.
- Cover relevant error conditions.

Use descriptive test names and place shared pytest fixtures in "tests/conftest.py".

New functionality should include appropriate tests where feasible.

9. Translation Contributions

MultiStudio uses Qt Linguist for application translations.

Translation files use the ".ts" extension and the Qt Linguist XML format. They are not TypeScript files.

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

10. Icons and Assets

MultiStudio uses SVG icons, including icons from the Lucide icon set.

Guidelines:

- Prefer consistent icon dimensions and visual style.
- Use SVG where appropriate.
- Keep asset names descriptive.
- Avoid duplicate or unused assets.
- Ensure contributed assets have compatible licenses.
- Update the relevant CMake resource configuration when adding new icons.

Do not add copyrighted assets without appropriate permission or licensing.

11. Reporting Bugs

Before reporting a bug:

1. Check existing GitHub issues.
2. Confirm the problem is reproducible.
3. Collect relevant error messages.
4. Identify the affected application version.
5. Remove sensitive information from logs and screenshots.

Use the repository's Bug Report issue template.

Include reproduction steps, expected behavior, actual behavior, and relevant environment details.

Do not report security vulnerabilities publicly.

12. Suggesting Features

We welcome ideas for improving MultiStudio.

Use the Feature Request issue template.

A useful feature request should explain:

- The problem or limitation.
- The proposed behavior.
- The expected user benefit.
- Any relevant alternatives.
- Examples or mockups, if available.

For large changes, discuss the proposal before beginning implementation.

13. Creating a Branch

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

14. Commit Messages

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

15. Submitting a Pull Request

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

16. Continuous Integration

MultiStudio uses GitHub Actions for automated project checks.

The intended CI workflow includes:

- CMake configuration.
- Windows application builds.
- QML linting.
- Python pytest tests.

Contributors should review CI results and resolve relevant failures before requesting a merge.

CI coverage may expand as the project develops.

17. Security Guidelines

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

18. Documentation Contributions

Documentation improvements are welcome.

When editing documentation:

- Use clear and understandable English.
- Keep instructions consistent with the current implementation.
- Include commands that can be reproduced.
- Avoid documenting unfinished functionality as complete.
- Use Markdown formatting consistently.
- Update related documentation when behavior changes.

Examples and screenshots should accurately represent MultiStudio.

19. Review Process

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

20. Community Standards

All contributors must follow the "Code of Conduct" (CODE_OF_CONDUCT.md).

We encourage respectful technical discussions, constructive feedback, and collaboration.

Disagreements should focus on code, design, and evidence rather than individuals.

21. Getting Help

If you need assistance:

- Review the project README.
- Search existing issues.
- Check available documentation.
- Open a GitHub Discussion if the repository has Discussions enabled.
- Ask a focused question in an appropriate project issue.

Please provide relevant technical details when requesting help.

22. Thank You

Every contribution helps improve MultiStudio.

Whether you contribute code, tests, translations, documentation, design ideas, or bug reports, your effort helps move the project forward.

Thank you for contributing to MultiStudio!
