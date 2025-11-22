set_project("Ciallo")

set_version("0.0.1")

set_xmakever("2.7.9")

set_allowedplats("windows")

set_warnings("all")
set_languages("c++20")

add_rules("mode.debug", "mode.release")

add_requires("fmt")
add_requires("spdlog")
add_requires("glfw")
add_requires("glad")
add_requires("stb")
add_requires("entt")
add_requires("glm")
add_requires("cgal")

target("dlib")
    set_kind("static")
    add_files("dlib/dlib/all/source.cpp")
    add_includedirs("dlib", {public = true})

target("imgui")
    set_kind("static")
    add_files("imgui/*.cpp")
    add_includedirs("imgui", {public = true})
    add_defines("IMGUI_DEFINE_MATH_OPERATORS", {public = true})

    add_packages("glm", "glfw")

target("Ciallo")
    set_kind("binary")

    add_files("Ciallo/*.cpp|Ciallo/pch.cpp")
    set_pcxxheader("Ciallo/pch.hpp")

    add_defines("_CRT_SECURE_NO_WARNINGS")
    add_defines("ENTT_USE_ATOMIC")

    add_deps("dlib", "imgui")
    add_packages("fmt", "spdlog", "glfw", "glad", "stb", "entt", "glm", "cgal")

    set_rundir("Ciallo")
