"""Shared pytest configuration for MultiStudio tests."""
import os
import shutil
import subprocess
from pathlib import Path

import pytest


# Project paths
PROJECT_ROOT = Path(__file__).resolve().parents[1]
BUILD_DIR = PROJECT_ROOT / "build" / "mingw-debug"
QML_DIR = PROJECT_ROOT / "apps" / "desktop" / "qml"
ICONS_DIR = PROJECT_ROOT / "apps" / "desktop" / "assets" / "icons"
TRANSLATIONS_DIR = PROJECT_ROOT / "translations"

QT_BIN_DIR = Path("D:/Qt/6.12.0/mingw_64/bin")


# Directory fixtures
@pytest.fixture(scope="session")
def project_root() -> Path:
    return PROJECT_ROOT


@pytest.fixture(scope="session")
def build_dir() -> Path:
    return BUILD_DIR


@pytest.fixture(scope="session")
def qml_dir() -> Path:
    return QML_DIR


@pytest.fixture(scope="session")
def icons_dir() -> Path:
    return ICONS_DIR


@pytest.fixture(scope="session")
def translations_dir() -> Path:
    return TRANSLATIONS_DIR


# Tool fixtures
@pytest.fixture(scope="session")
def cmake_executable() -> str:
    executable = shutil.which("cmake")

    if executable is None:
        pytest.skip("CMake is not installed or not in PATH")

    return executable


@pytest.fixture(scope="session")
def qmllint_executable() -> Path:
    executable = QT_BIN_DIR / "qmllint.exe"

    if not executable.is_file():
        pytest.skip(f"qmllint not found: {executable}")

    return executable


# Environment fixtures
@pytest.fixture(scope="session")
def qt_environment(build_dir: Path) -> dict[str, str]:
    environment = os.environ.copy()

    environment["QML_IMPORT_PATH"] = str(build_dir)

    environment["PATH"] = (
        str(QT_BIN_DIR)
        + os.pathsep
        + environment.get("PATH", "")
    )

    return environment


# Command runner
@pytest.fixture(scope="session")
def run_command():
    def execute(
        command: list[str],
        cwd: Path = PROJECT_ROOT,
        env: dict[str, str] | None = None,
        timeout: int = 120,
    ) -> subprocess.CompletedProcess[str]:
        return subprocess.run(
            command,
            cwd=cwd,
            env=env,
            capture_output=True,
            text=True,
            encoding="utf-8",
            errors="replace",
            timeout=timeout,
            check=False,
        )

    return execute
