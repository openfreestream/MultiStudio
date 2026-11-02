cmake_minimum_required(VERSION 3.24)

project(MultiStudio
    VERSION 0.1.0
    DESCRIPTION "Open-source multistreaming studio"
    LANGUAGES CXX
)

# C++ configuration
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

# Build options
option(MULTISTUDIO_BUILD_TESTS
    "Build MultiStudio tests" OFF)

option(MULTISTUDIO_ENABLE_CLANG_TIDY
    "Enable clang-tidy analysis" OFF)

# Qt 6
find_package(Qt6 6.12 REQUIRED COMPONENTS
    Core
    Gui
    Quick
    QuickControls2
    LinguistTools
    Multimedia
    Network
)

qt_standard_project_setup(REQUIRES 6.12)
qt_policy(SET QTP0004 NEW)

# FFmpeg
find_package(PkgConfig QUIET)

if(PkgConfig_FOUND)
    pkg_check_modules(FFMPEG QUIET IMPORTED_TARGET
        libavcodec
        libavformat
        libavutil
        libavdevice
        libavfilter
        libswscale
        libswresample
    )
endif()

# clang-tidy
if(MULTISTUDIO_ENABLE_CLANG_TIDY)
    find_program(CLANG_TIDY_EXE NAMES clang-tidy)

    if(NOT CLANG_TIDY_EXE)
        message(FATAL_ERROR
            "clang-tidy was enabled but not found"
        )
    endif()

    set(CMAKE_CXX_CLANG_TIDY "${CLANG_TIDY_EXE}")
endif()

# Application
qt_add_executable(MultiStudio
    apps/desktop/src/main.cpp
)

# QML module configuration
set(MULTISTUDIO_QML_FILES
    apps/desktop/qml/Main.qml
    apps/desktop/qml/components/Sidebar.qml
    apps/desktop/qml/components/NavigationButton.qml
    apps/desktop/qml/panels/PreviewPanel.qml
    apps/desktop/qml/panels/AboutPanel.qml
    apps/desktop/qml/panels/ScenesPanel.qml
    apps/desktop/qml/panels/SourcesPanel.qml
)

foreach(qml_file IN LISTS MULTISTUDIO_QML_FILES)
    get_filename_component(qml_name "${qml_file}" NAME)

    set_source_files_properties("${qml_file}"
        PROPERTIES
            QT_RESOURCE_ALIAS "${qml_name}"
    )
endforeach()

qt_add_qml_module(MultiStudio
    URI MultiStudio
    VERSION 1.0
    OUTPUT_DIRECTORY
        "${CMAKE_CURRENT_BINARY_DIR}/MultiStudio"
    QML_FILES
        ${MULTISTUDIO_QML_FILES}
)

# Theme module
set_source_files_properties(
    apps/desktop/qml/theme/Theme.qml
    PROPERTIES
        QT_QML_SINGLETON_TYPE TRUE
        QT_RESOURCE_ALIAS "Theme.qml"
)

qt_add_library(multistudio_theme STATIC)

qt_add_qml_module(multistudio_theme
    URI MultiStudio.Theme
    VERSION 1.0
    OUTPUT_DIRECTORY
        "${CMAKE_CURRENT_BINARY_DIR}/MultiStudio/Theme"
    QML_FILES
        apps/desktop/qml/theme/Theme.qml
)

target_link_libraries(MultiStudio PRIVATE
    multistudio_themeplugin
)

# Lucide icons
set(MULTISTUDIO_ICON_NAMES
    layout-dashboard
    monitor-play
    radio
    sliders-vertical
    audio-waveform
    puzzle
    chart-no-axes-combined
    settings
)

foreach(icon IN LISTS MULTISTUDIO_ICON_NAMES)
    set(icon_file
        "${CMAKE_CURRENT_SOURCE_DIR}/apps/desktop/assets/icons/sidebar/${icon}.svg"
    )

    if(NOT EXISTS "${icon_file}")
        message(FATAL_ERROR
            "Missing Lucide icon: ${icon_file}"
        )
    endif()

    qt_add_resources(MultiStudio "lucide_${icon}"
        PREFIX "/qt/qml/MultiStudio/icons"
        BASE "${CMAKE_CURRENT_SOURCE_DIR}/apps/desktop/assets/icons/sidebar"
        FILES "${icon_file}"
    )
endforeach()

set(MULTISTUDIO_ABOUT_ICON_NAMES
    code-xml
    cpu
    film
    github
    info
    layers
    scale
    tag
    wrench
)

foreach(icon IN LISTS MULTISTUDIO_ABOUT_ICON_NAMES)
    set(icon_file
        "${CMAKE_CURRENT_SOURCE_DIR}/apps/desktop/assets/icons/about/${icon}.svg"
    )

    if(NOT EXISTS "${icon_file}")
        message(FATAL_ERROR
            "Missing about icon: ${icon_file}"
        )
    endif()

    qt_add_resources(MultiStudio "about_${icon}"
        PREFIX "/qt/qml/MultiStudio/icons/about"
        BASE "${CMAKE_CURRENT_SOURCE_DIR}/apps/desktop/assets/icons/about"
        FILES "${icon_file}"
    )
endforeach()

# Translations
set(MULTISTUDIO_TRANSLATION_FILES
    "${CMAKE_CURRENT_SOURCE_DIR}/translations/lang_cs.ts"
    "${CMAKE_CURRENT_SOURCE_DIR}/translations/lang_de.ts"
    "${CMAKE_CURRENT_SOURCE_DIR}/translations/lang_es.ts"
    "${CMAKE_CURRENT_SOURCE_DIR}/translations/lang_fr.ts"
    "${CMAKE_CURRENT_SOURCE_DIR}/translations/lang_pl.ts"
)

add_subdirectory(translations)

# Qt libraries
target_link_libraries(MultiStudio PRIVATE
    Qt6::Core
    Qt6::Gui
    Qt6::Quick
    Qt6::QuickControls2
    Qt6::Multimedia
    Qt6::Network
)

# FFmpeg integration
if(FFMPEG_FOUND)
    target_link_libraries(MultiStudio PRIVATE
        PkgConfig::FFMPEG
    )

    target_compile_definitions(MultiStudio PRIVATE
        MULTISTUDIO_HAS_FFMPEG=1
    )
else()
    message(WARNING
        "FFmpeg development libraries not found. "
        "Streaming engine is disabled."
    )
endif()

# Compiler warnings
if(MSVC)
    target_compile_options(MultiStudio PRIVATE
        /W4
        /permissive-
    )
else()
    target_compile_options(MultiStudio PRIVATE
        -Wall
        -Wextra
        -Wpedantic
    )
endif()

# Platform configuration
set_target_properties(MultiStudio PROPERTIES
    WIN32_EXECUTABLE FALSE
    MACOSX_BUNDLE TRUE
)

# Testing
if(MULTISTUDIO_BUILD_TESTS)
    enable_testing()
    add_subdirectory(tests)
endif()

# Installation
include(GNUInstallDirs)

install(TARGETS MultiStudio
    BUNDLE DESTINATION .
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)

# Build summary
message(STATUS "MultiStudio ${PROJECT_VERSION}")
message(STATUS "Platform: ${CMAKE_SYSTEM_NAME}")
message(STATUS "C++ standard: ${CMAKE_CXX_STANDARD}")
message(STATUS "FFmpeg available: ${FFMPEG_FOUND}")
