Security Policy

Thank you for helping keep MultiStudio and its users safe.

MultiStudio is an open-source desktop application for live streaming and multistreaming, built with C++20, Qt 6, QML, and optional FFmpeg integration.

We take security seriously and encourage responsible disclosure of vulnerabilities.

Supported Versions

MultiStudio is currently in early development.

Version| Security Support
0.1.x (Development)| Best-effort
Older versions| Not supported

Security support may change as the project evolves.

Reporting a Vulnerability

Please do not report security vulnerabilities through public GitHub issues, discussions, or pull requests.

If you discover a potential security vulnerability, please report it privately.

Preferred Reporting Method

Use GitHub's private vulnerability reporting feature, if enabled for the repository:

1. Open the MultiStudio GitHub repository.
2. Navigate to the Security tab.
3. Select Report a vulnerability.
4. Provide the relevant details.

If private vulnerability reporting is not available, contact the project maintainers through a private security contact method published in the repository.

Do not disclose sensitive vulnerability details publicly before maintainers have had an opportunity to investigate.

What to Include in a Report

Please provide as much relevant information as possible:

- A description of the vulnerability.
- The affected MultiStudio version or commit.
- Your operating system and relevant environment details.
- Steps to reproduce the issue safely.
- The expected and actual behavior.
- The potential security impact.
- Relevant logs, screenshots, or a minimal proof of concept.
- Any suggested mitigation or fix.

Never include real stream keys, passwords, access tokens, or other private credentials in your report.

Security Response Process

The maintainers aim to:

1. Review incoming security reports.
2. Assess the severity and potential impact.
3. Reproduce and investigate the vulnerability.
4. Develop and test an appropriate fix.
5. Release a security update when applicable.
6. Coordinate public disclosure when appropriate.

Response and resolution times are not guaranteed, particularly during early development.

Security Scope

Security issues may include, but are not limited to:

Streaming Credentials

- Exposure of stream keys or authentication tokens.
- Insecure storage of credentials.
- Accidental logging of sensitive information.
- Unauthorized access to connected streaming accounts.

Network Security

- Insecure communication with streaming services.
- Improper TLS certificate validation.
- Unauthorized network requests.
- Vulnerabilities affecting RTMP, RTMPS, or other supported streaming protocols.

Media Processing

- Vulnerabilities in media file parsing.
- Unsafe handling of untrusted media sources.
- Memory corruption or crashes caused by malformed input.
- Security issues involving FFmpeg or other media-processing dependencies.

Application Security

- Arbitrary code execution.
- Privilege escalation.
- Unsafe file handling.
- Path traversal.
- Insecure configuration storage.
- Unauthorized access to local files.

Dependencies

- Vulnerabilities in Qt, FFmpeg, or other third-party libraries.
- Compromised build dependencies.
- Security issues in packaging or distribution processes.

Security Best Practices for Users

We recommend that MultiStudio users:

- Download releases only from official project distribution channels.
- Keep MultiStudio and their operating system updated.
- Never share stream keys or authentication tokens.
- Use secure streaming protocols when supported.
- Avoid opening untrusted media files.
- Review permissions before connecting external services.
- Revoke and replace credentials immediately if they may have been exposed.

Security Best Practices for Contributors

Contributors should:

- Never commit secrets, credentials, or private keys.
- Avoid printing sensitive information in logs.
- Validate untrusted input.
- Follow secure C++ and Qt development practices.
- Use memory-safe APIs and appropriate bounds checking.
- Keep dependencies updated.
- Avoid disabling TLS certificate verification.
- Review security implications before introducing new network or media-processing functionality.
- Include relevant tests when fixing security vulnerabilities.

Responsible Disclosure

We ask security researchers to:

- Avoid accessing data belonging to other users.
- Avoid disrupting services or systems.
- Use test accounts and test environments whenever possible.
- Limit testing to systems they own or are authorized to assess.
- Allow maintainers a reasonable opportunity to investigate and resolve reported issues.

We appreciate responsible security research that helps improve MultiStudio.

Third-Party Dependencies

MultiStudio uses or may integrate third-party components, including:

- Qt
- FFmpeg
- CMake
- Other open-source libraries

Security vulnerabilities originating in third-party dependencies may require updates or fixes from their respective maintainers.

Security Updates

Security fixes may be distributed through new MultiStudio releases or source-code updates.

Users should monitor the project's official repository for security advisories and release announcements.

Contact

For security-related concerns, use the repository's private vulnerability reporting feature when available.

Please avoid publishing sensitive vulnerability information in public communication channels.

---

MultiStudio — Open-source multistreaming studio

Thank you for helping make MultiStudio safer for everyone.
