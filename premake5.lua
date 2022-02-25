workspace "Space Invaders"

	architecture "x86"
	

	configurations
	{
		"Debug",
		"Release"
	}

outputdir="%{cfg.system	}-%{cfg.buildcfg}-%{cfg.architecture}"
project "Space Invaders"
	location "Space Invaders"
	kind "ConsoleApp"

	language "C++"

	targetdir("bin/"..outputdir.."/%{prj.name}")
	objdir("bin/intermediates/"..outputdir.."/%{prj.name}")

	files{
		"%{prj.name}/res/**.shader",
		"%{prj.name}/res/**.png",
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp",
		"%{prj.name}/**.h",
		"%{prj.name}/**.cpp"

	}

	includedirs{
		"%{prj.name}/src/vendor",
		"Dependencies/include",
		"%{prj.name}"
	}

	libdirs{
		"Dependencies/lib",
	}
	
	--for Windows///////////////////////////////////////////////////////////////////////////////////////////////
	filter "system:Windows"
		system "windows"
		cppdialect "C++17"
		cdialect "C89"
		staticruntime "On"
		systemversion "latest"

		defines
		{
			"WIN32",
			"_CRT_SECURE_NO_WARNINGS"	
		}

	filter "configurations:Debug"
		symbols "On"
		buildoptions "/MDd"
		links
		{
			"sfml-system-d",
			"sfml-graphics-d",
			"sfml-window-d",
			"sfml-audio-d",
			"sfml-network-d",
	
		}
	filter "configurations:Release"
		optimize "On"
		buildoptions "/MD"
		links
		{
			"sfml-system",
			"sfml-graphics",
			"sfml-window",
			"sfml-audio",
			"sfml-network",
	
		}


	--for Linux///////////////////////////////////////////////////////////////////////////////////////////////
	filter "system:Unix"
		system "linux"
		cppdialect "C++17"
		cdialect "C89"
		staticruntime "On"
		systemversion "latest"

		defines
		{
			"_CRT_SECURE_NO_WARNINGS"	
		}

	filter "configurations:Debug"
		symbols "On"
		buildoptions "/MDd"
		links
		{
			
			"sfml-system-d",
			"sfml-graphics-d",
			"sfml-window-d",
			"sfml-audio-d",
			"sfml-network-d",
	
		}
	filter "configurations:Release"
		optimize "On"
		buildoptions "/MD"
		links
		{
			"sfml-system",
			"sfml-graphics",
			"sfml-window",
			"sfml-audio",
			"sfml-network",

	
		}

	--for Mac///////////////////////////////////////////////////////////////////////////////////////////////
	filter "system:Mac"
		system "macosx"
		cppdialect "C++17"
		cdialect "C89"
		staticruntime "On"
		systemversion "latest"

		defines
		{
			"_CRT_SECURE_NO_WARNINGS"	
		}

	filter "configurations:Debug"
		symbols "On"
		buildoptions "/MDd"
		links
		{
			
			"sfml-system-d",
			"sfml-graphics-d",
			"sfml-window-d",
			"sfml-audio-d",
			"sfml-network-d",
	
		}
	filter "configurations:Release"
		optimize "On"
		buildoptions "/MD"
		links
		{
			"sfml-system",
			"sfml-graphics",
			"sfml-window",
			"sfml-audio",
			"sfml-network",

	
		}