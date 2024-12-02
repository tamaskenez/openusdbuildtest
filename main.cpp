// Mostly written by ChatGPT

#include <pxr/usd/usd/stage.h>
#include <pxr/usd/usdGeom/sphere.h>
#include <pxr/base/tf/stringUtils.h>

#include <iostream>
#include <filesystem>
namespace fs = std::filesystem;

PXR_NAMESPACE_USING_DIRECTIVE

int main() {
    std::error_code ec;

    fs::remove("hello.usda", ec);
    
    // Create a new USD stage and save it to "hello.usda"
    auto stage = UsdStage::CreateNew("hello.usda");

    if (!stage) {
        std::cerr << "Failed to create USD stage." << std::endl;
        return 1;
    }

    // Define a sphere at the root of the stage
    auto sphere = UsdGeomSphere::Define(stage, SdfPath("/HelloSphere"));

    if (!sphere) {
        std::cerr << "Failed to create sphere." << std::endl;
        return 1;
    }

    // Set the radius of the sphere
    sphere.GetRadiusAttr().Set(1.0);

    // Set a custom comment or description
    sphere.GetPrim().SetDocumentation("This is a simple sphere for OpenUSD 'Hello, World!'");

    // Save the stage to disk
    stage->GetRootLayer()->Save();

    std::cout << "USD file 'hello.usda' created successfully." << std::endl;

    return fs::exists("hello.usda", ec) && fs::file_size("hello.usda", ec) > 0
            ? EXIT_SUCCESS
            : EXIT_FAILURE;
}
