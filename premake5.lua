workspace "C++ fps"
    configurations { "Debug", "Release" }

    project "Engine"
      location "Engine"
      cppdialect "C++20"
      kind "SharedLib"
      defines "EngineExport"
      language "C++"
      targetdir "bin/%{cfg.buildcfg}"
      objdir "obj/%{cfg.buildcfg}"
   
      files { "Engine/Src/**.h", "Engine/Src/**.cpp", "Engine/Include/Engine.h"}
   
      filter "configurations:Debug"
        defines { "DEBUG" }
        symbols "On"
   
      filter "configurations:Release"
         defines { "NDEBUG" }
         optimize "On"

    project "Client"
      location "Client"
      cppdialect "C++20"
      language "C++"
      targetdir "bin/%{cfg.buildcfg}"
      objdir "obj/%{cfg.buildcfg}"

      files { "Client/Src/**.h", "Client/Src/**.cpp"}
      includedirs { "Engine/Include/"}
      links { "Engine" }
      -- premake docs is amazing
      filter "configurations:Debug"
        defines { "DEBUG" }
        kind "ConsoleApp"
        symbols "On"

      filter "configurations:Release"
         defines { "NDEBUG" }
         kind "WindowedApp"
         optimize "On"

    project "MapEditor"
      location "MapEditor"
      cppdialect "C++20"
      kind "ConsoleApp"
      language "C++"
      targetdir "bin/%{cfg.buildcfg}"
      objdir "obj/%{cfg.buildcfg}"

      files { "MapEditor/Src/**.h", "MapEditor/Src/**.cpp"}

      filter "configurations:Debug"
        defines { "DEBUG" }
        symbols "On"

      filter "configurations:Release"
         defines { "NDEBUG" }
         optimize "On"


   
    -- multiplayer in the future maybe ;)