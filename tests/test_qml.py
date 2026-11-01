from pathlib import Path

def test_qml_files_exist(qml_dir: Path) -> None:
    qml_files = list(qml_dir.rglob("*.qml"))

    assert qml_files, "No QML files found"

def test_qmllint_available(qmllint_executable: Path) -> None:
    assert qmllint_executable.is_file()
