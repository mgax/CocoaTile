import os.path
import objc


def main():
    bundle_path = os.path.join(os.path.abspath(os.path.dirname(__file__)),
                               'build/Release/CocoaTileDriver.bundle')

    CocoaTileDriver = objc.loadBundle("CocoaTileDriver", globals(), bundle_path)
    WindowDriver = CocoaTileDriver.classNamed_("WindowDriver")
    print WindowDriver.getAnswer()

if __name__ == '__main__':
    main()
