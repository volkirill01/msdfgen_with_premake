project "freetype"
	location "freetype"
	kind "StaticLib"
	language "C"
	staticruntime "off"

	warnings "Off"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"freetype/include/ft2build.h",
		"freetype/include/freetype/*.h",
		"freetype/include/freetype/config/*.h",
		"freetype/include/freetype/internal/*.h",

		"freetype/src/autofit/autofit.c",
		"freetype/src/base/ftbase.c",
		"freetype/src/base/ftbbox.c",
		"freetype/src/base/ftbdf.c",
		"freetype/src/base/ftbitmap.c",
		"freetype/src/base/ftcid.c",
		"freetype/src/base/ftdebug.c",
		"freetype/src/base/ftfstype.c",
		"freetype/src/base/ftgasp.c",
		"freetype/src/base/ftglyph.c",
		"freetype/src/base/ftgxval.c",
		"freetype/src/base/ftinit.c",
		"freetype/src/base/ftmm.c",
		"freetype/src/base/ftotval.c",
		"freetype/src/base/ftpatent.c",
		"freetype/src/base/ftpfr.c",
		"freetype/src/base/ftstroke.c",
		"freetype/src/base/ftsynth.c",
		"freetype/src/base/ftsystem.c",
		"freetype/src/base/fttype1.c",
		"freetype/src/base/ftwinfnt.c",
		"freetype/src/bdf/bdf.c",
		"freetype/src/bzip2/ftbzip2.c",
		"freetype/src/cache/ftcache.c",
		"freetype/src/cff/cff.c",
		"freetype/src/cid/type1cid.c",
		"freetype/src/gzip/ftgzip.c",
		"freetype/src/lzw/ftlzw.c",
		"freetype/src/pcf/pcf.c",
		"freetype/src/pfr/pfr.c",
		"freetype/src/psaux/psaux.c",
		"freetype/src/pshinter/pshinter.c",
		"freetype/src/psnames/psnames.c",
		"freetype/src/raster/raster.c",
		"freetype/src/sdf/sdf.c",
		"freetype/src/sfnt/sfnt.c",
		"freetype/src/smooth/smooth.c",
		"freetype/src/truetype/truetype.c",
		"freetype/src/type1/type1.c",
		"freetype/src/type42/type42.c",
		"freetype/src/winfonts/winfnt.c"
	}

	includedirs
	{
		"freetype/include"
	}

	defines
	{
		"FT2_BUILD_LIBRARY",
		"_CRT_SECURE_NO_WARNINGS",
		"_CRT_NONSTDC_NO_WARNINGS",
	}

	filter "system:windows"
		systemversion "latest"

	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		runtime "Release"
		optimize "on"

	filter "configurations:Dist"
		runtime "Release"
		optimize "on"
		symbols "off"

project "msdfgen"
	kind "StaticLib"
	language "C++"
	cppdialect "C++17"
	staticruntime "off"

	warnings "Off"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"core/**.h",
		"core/**.hpp",
		"core/**.cpp",
		"ext/**.h",
		"ext/**.hpp",
		"ext/**.cpp",
		"lib/**.cpp",
		"include/**.h"
	}

	includedirs
	{
		"include",
		"freetype/include"
	}

	defines
	{
		"MSDFGEN_USE_CPP11"
	}

	links
	{
		"freetype"
	}

	filter "system:windows"
		systemversion "latest"

	filter "configurations:Debug"
		runtime "Debug"
		symbols "On"
		optimize "Off"

	filter "configurations:Release"
		runtime "Release"
		symbols "On"
		optimize "On"

	filter "configurations:Dist"
		runtime "Release"
		symbols "Off"
		optimize "Speed"