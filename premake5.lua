-- 1. 项目定义
project "ImGui"  -- 使用标准命名
    kind "StaticLib"
    language "C++"
    cppdialect "C++17"
    staticruntime "On"
    targetdir ("%{wks.location}/bin/" .. outputdir .. "/%{prj.name}")
    objdir   ("%{wks.location}/bin-int/".. outputdir .. "/%{prj.name}")

-- 2. 通用源文件
    files
    {
        "imconfig.h",
        "imgui.h",
        "imgui.cpp",
        "imgui_draw.cpp",
        "imgui_internal.h",
        "imgui_tables.cpp",
        "imgui_widgets.cpp",
        "imstb_rectpack.h",
        "imstb_textedit.h",
        "imstb_truetype.h",
        "imgui_demo.cpp"
    }

-- 3. 平台分支
    filter "system:windows"
        systemversion "latest"
        buildoptions "/D_CRT_SECURE_NO_WARNINGS"  -- 只保留必要的编译选项
    
    filter "system:linux"
        pic "On"


-- 4. 通用编译选项
    filter "configurations:Debug"
        symbols "On"
        runtime "Debug"

    filter "configurations:Release"
        optimize "On"
        runtime "Release"
