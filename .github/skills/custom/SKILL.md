---
name: multistudio
description: Develop, debug, review, and maintain the MultiStudio C++20 and Qt 6 application while preserving its existing architecture, coding conventions, and project configuration.
---

# MultiStudio Development Skill

## Project Overview

MultiStudio is an open-source desktop application for multistreaming and live production.

The application is developed primarily in C++20 using Qt 6, Qt Quick, and QML.

The project targets Windows with MinGW and CMake.

The goal is to build a modern, reliable, extensible streaming studio.

## Technology Stack

- Language: C++20
- Framework: Qt 6.12
- User interface: Qt Quick and QML
- Build system: CMake 3.24+
- Build generator: Ninja
- Compiler: MinGW-w64
- Multimedia: Qt Multimedia
- Networking: Qt Network
- Streaming backend: FFmpeg (optional)
- Icons: Lucide SVG
- Task runner: Taskfile
- Version control: Git

## Project Structure

The primary project files are:

- `CMakeLists.txt`
- `CMakePresets.json`
- `Taskfile.yml`
- `.pre-commit-config.yaml`
- `.editorconfig`
- `.prettierrc`
- `eslint.config.js`

Application source files:

- `apps/desktop/src/main.cpp`
- `apps/desktop/qml/Main.qml`
- `apps/desktop/qml/components/Sidebar.qml`
- `apps/desktop/assets/icons/`

Build output:

- `build/mingw-debug/`

Do not assume additional directories or components exist without checking the repository.

## Development Environment

The current Windows development environment uses:

- Qt: `D:/Qt/6.12.0/mingw_64`
- MinGW: `D:/Qt/Tools/mingw1310_64`
- Project: `D:/Dev/multistream`
- CMake preset: `windows-mingw-debug`
- Executable: `build/mingw-debug/MultiStudio.exe`

Treat these as local development paths, not portable application paths.

Do not hardcode machine-specific paths in application source code.

## Coding Style

Preserve the existing style of every file.

General rules:

- Use 4 spaces for C++, QML, CMake, and JavaScript.
- Use 2 spaces for YAML.
- Use UTF-8 encoding.
- Use LF line endings.
- Remove unnecessary trailing whitespace.
- Keep existing comments and section ordering.
- Use descriptive names.
- Prefer readable code over clever abstractions.

Do not introduce decorative section headers unless the file already uses them.

Do not reformat unrelated code.

Do not rename variables, functions, classes, or files without a concrete reason.

## C++ Guidelines

Use modern C++20.

Prefer:

- RAII for resource management.
- Smart pointers where ownership requires them.
- Const correctness.
- Explicit ownership and lifetime management.
- Standard library facilities when appropriate.
- Qt types when integrating with Qt APIs.
- Clear error handling.

Avoid:

- Unnecessary raw owning pointers.
- Global mutable state.
- Unnecessary dependencies.
- Deprecated Qt APIs.
- Blocking the UI thread.
- Excessive abstractions.

Respect Qt's object ownership model.

## Qt and QML Guidelines

Use Qt 6 APIs.

Keep UI presentation in QML and application logic in C++ when appropriate.

Use:

- `QQmlApplicationEngine` for loading the QML application.
- `qt_add_qml_module()` for QML registration.
- `qt_add_resources()` for application resources.
- Qt signals and slots for communication.
- Qt Quick Layouts for responsive interfaces.

Avoid hardcoded absolute paths to QML files or icons.

Use Qt resource URLs when referencing bundled assets.

Check QML module imports and resource aliases before changing the project structure.

## QML Module

The main QML module is:

`MultiStudio`

The application entry component is:

`Main.qml`

The sidebar component is:

`Sidebar.qml`

When modifying QML:

1. Check the resource aliases in `CMakeLists.txt`.
2. Verify the correct import path.
3. Avoid duplicate component registrations.
4. Run QML linting when available.
5. Verify that the application window loads successfully.

Do not assume that a physical source directory is also available as a QML resource directory.

## CMake Guidelines

Preserve the existing CMake architecture.

Keep:

- `project(MultiStudio ...)`
- C++20 configuration.
- Qt 6 dependencies.
- Optional FFmpeg detection.
- Optional clang-tidy.
- Existing compiler warnings.
- QML module registration.
- Lucide resource registration.
- Test configuration.
- Installation rules.

Do not replace the complete build system without an explicit request.

Do not introduce Conan, vcpkg, Meson, or another package manager without approval.

Use the existing CMake presets.

## Build Commands

Configure:

```powershell
cmake --preset windows-mingw-debug
```

Build:

```powershell
cmake --build --preset windows-mingw-debug
```

Run:

```powershell
.\build\mingw-debug\MultiStudio.exe
```

When Taskfile is installed, prefer:

```powershell
task build
task run
task debug
```

Verify that Taskfile tasks exist before relying on them.

## Debugging Guidelines

Always investigate the actual error before suggesting major changes.

For application startup failures:

1. Confirm that CMake configuration succeeds.
2. Confirm that compilation and linking succeed.
3. Check the executable exit status.
4. Inspect Qt plugin diagnostics.
5. Inspect QML import errors.
6. Check `main.cpp`.
7. Check QML resource aliases.
8. Apply the smallest necessary fix.
9. Rebuild and verify the result.

Useful diagnostics:

```powershell
$env:QT_DEBUG_PLUGINS = "1"
$env:QML_IMPORT_TRACE = "1"
```

On Windows, a GUI-subsystem executable may not display diagnostic output in the terminal.

For debugging, `WIN32_EXECUTABLE FALSE` may be used temporarily.

Restore the intended release configuration after debugging.

Do not treat optional FFmpeg warnings as fatal build errors.

## Streaming Architecture

MultiStudio is intended to support streaming to multiple destinations.

Future streaming features should prioritize:

- Reliable stream lifecycle management.
- Independent destination configuration.
- Clear connection status.
- Audio and video synchronization.
- Proper error reporting.
- Safe resource cleanup.
- Responsive UI.
- Extensible architecture.

Do not claim that streaming functionality is implemented unless the corresponding code exists.

FFmpeg integration must remain optional until explicitly made mandatory.

## User Interface Guidelines

The interface uses a modern dark desktop design.

Existing visual conventions include:

- Dark backgrounds.
- Sidebar navigation.
- Lucide SVG icons.
- Clear active navigation states.
- Consistent spacing.
- Readable typography.

Preserve the existing visual design unless redesign is explicitly requested.

Avoid unnecessary UI frameworks.

Prefer reusable QML components where they materially reduce duplication.

## Configuration Files

Use the existing configuration tools:

- `.editorconfig` for editor conventions.
- `.prettierrc` for supported text formats.
- `eslint.config.js` for standalone JavaScript.
- `.pre-commit-config.yaml` for Git checks.
- `Taskfile.yml` for development commands.

ESLint and Prettier are not replacements for Qt QML tooling.

Use `qmllint` for QML checks.

Use clang-format for C++ when configured.

## Testing and Validation

Before reporting a change as successful:

1. Verify the edited file is syntactically valid.
2. Run relevant formatting or lint checks.
3. Configure CMake if build configuration changed.
4. Build the application if C++ or QML changed.
5. Run the application when possible.
6. Report remaining warnings or limitations.

Never claim a build or test passed unless it was actually executed successfully.

## AI Assistant Behavior

When assisting with MultiStudio:

- Communicate with the developer in Czech.
- Write code, comments, and identifiers in English.
- Preserve the user's coding style.
- Respect the existing architecture.
- Explain the root cause of bugs.
- Prefer minimal, targeted changes.
- Provide complete files when explicitly requested.
- Avoid unrelated modifications.
- Do not invent files, classes, functions, or test results.
- Ask for missing source code when required for an accurate fix.
- Clearly distinguish verified facts from assumptions.

When the developer requests a complete file, provide the complete updated file without omitting existing sections.

When the developer requests a small fix, provide only the necessary changes unless a complete file is requested.

## Security and Reliability

Never commit:

- API keys.
- Streaming credentials.
- Access tokens.
- Passwords.
- Private configuration files.

Do not print sensitive streaming credentials in logs.

Validate external inputs.

Handle network failures safely.

Avoid exposing unnecessary network services.

## Definition of Done

A development task is complete when:

- The requested functionality is implemented.
- Existing functionality is preserved.
- The code follows project conventions.
- Relevant validation succeeds.
- No unrelated files are modified.
- Known limitations are clearly reported.

The primary principle is:

**Preserve the project. Fix the problem. Verify the result.**
