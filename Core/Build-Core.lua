project "Core"
   kind "ConsoleApp"
   language "C++"
   cppdialect "C++20"
   targetdir "Binaries/%{cfg.buildcfg}"
   staticruntime "off"

   targetdir ("../Binaries/" .. OutputDir .. "/%{prj.name}")
   objdir ("../Binaries/Intermediates/" .. OutputDir .. "/%{prj.name}")

   -- Source
   files { 
       "Source/**.h", 
       "Source/**.cpp",
   }

   -- Static libraries
   files { 
       "StaticLibs/**.c",
       "StaticLibs/**.cpp",
   }

   -- Shaders
   files { 
       "Shaders/**.fs",
       "Shaders/**.vs"
   }

   includedirs
   {
      "Source",
      "Includes"
   }

   libdirs { "Libs" }
   links { "glfw3", "opengl32", "assimp", "freetype", "irrKlang" }

   filter "system:windows"
       defines { "_CRT_SECURE_NO_WARNINGS" }
       systemversion "latest"
       defines { }

   filter "configurations:Debug"
       defines { "DEBUG" }
       runtime "Debug"
       symbols "On"

   filter "configurations:Release"
       defines { "RELEASE" }
       runtime "Release"
       optimize "On"
       symbols "On"