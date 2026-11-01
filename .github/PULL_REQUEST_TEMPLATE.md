Pull Request

Description

Provide a clear and concise description of the changes introduced by this pull request.

Explain what was changed and why.

Related Issues

Closes #

Related to #

Type of Change

Select all that apply:

- [ ] Bug fix
- [ ] New feature
- [ ] Performance improvement
- [ ] UI/UX improvement
- [ ] Refactoring
- [ ] Documentation update
- [ ] Translation update
- [ ] Build system change
- [ ] Security fix
- [ ] Tests
- [ ] Other

Changes Made

Describe the main changes:

- 
- 
- 

Screenshots or Recordings

If this pull request changes the user interface, include screenshots or recordings showing the changes.

Before:

After:

Testing

Describe how the changes were tested.

Build Verification

- [ ] CMake configuration succeeds.
- [ ] MultiStudio builds successfully.
- [ ] The application launches without unexpected errors.
- [ ] No new compiler warnings were introduced.

Qt / QML

- [ ] QML files pass "qmllint".
- [ ] QML components follow the project structure.
- [ ] UI elements use the shared "Theme.qml" where appropriate.
- [ ] User-visible strings use "qsTr()".
- [ ] Layouts and anchors are used correctly.
- [ ] The UI has been checked for visual regressions.

C++

- [ ] Code follows the C++20 project conventions.
- [ ] Memory and resource ownership are handled correctly.
- [ ] Inputs and error conditions are validated.
- [ ] No sensitive information is logged.
- [ ] Relevant tests have been added or updated.

Python Tests

- [ ] Relevant pytest tests pass.
- [ ] New functionality has appropriate test coverage.

Translations

- [ ] New user-visible strings are marked for translation.
- [ ] Existing translations remain compatible.
- [ ] Translation files have been updated where necessary.

Documentation

- [ ] Documentation has been updated where necessary.
- [ ] "CHANGELOG.md" has been updated if appropriate.

Commands Used

Include relevant verification commands or explain why they were not run.

cmake --preset windows-mingw-debug
cmake --build build/mingw-debug
cmake --build build/mingw-debug --target MultiStudio_qmllint
python -m pytest tests/ -v

Security Considerations

Does this change affect any of the following?

- Stream keys or authentication tokens
- Network communication
- Media processing
- File system access
- External dependencies
- Application permissions

If yes, describe the relevant security considerations without disclosing sensitive information.

Security vulnerabilities should be reported privately according to "SECURITY.md" (../SECURITY.md).

Final Checklist

- [ ] I have reviewed my own changes.
- [ ] My changes are focused and do not include unrelated modifications.
- [ ] I have not committed passwords, stream keys, tokens, or other secrets.
- [ ] I have followed the project's coding conventions.
- [ ] I have added or updated tests where appropriate.
- [ ] I have updated relevant documentation.
- [ ] I have checked for unintended changes.
- [ ] I am ready for review.

Additional Notes

Add any additional information that reviewers should know.
