import os.path
import objc


def main():
    bundle_path = os.path.join(os.path.abspath(os.path.dirname(__file__)),
                               'build/Release/CocoaTileDriver.bundle')

    CocoaTileDriver = objc.loadBundle("CocoaTileDriver", globals(), bundle_path)
    AccessibilityElement = CocoaTileDriver.classNamed_("AccessibilityElement")
    print AccessibilityElement.systemWide()

if __name__ == '__main__':
    main()
