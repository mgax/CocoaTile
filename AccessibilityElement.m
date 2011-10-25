#import "AccessibilityElement.h"

@implementation AccessibilityElement

- (id)init
{
    self = [super init];
    if (self) {
        elementRef = nil;
    }

    return self;
}

+ (AccessibilityElement*) elementWithRef: (AXUIElementRef)ref {
    AccessibilityElement* element = [AccessibilityElement new];
    element->elementRef = ref;
    return element;
}

+ (AccessibilityElement*) systemWide {
    NSAssert(AXAPIEnabled(), @"Accessibility API not enabled");

    AXUIElementRef ref = AXUIElementCreateSystemWide();
    NSAssert(ref != NULL, @"systemElementRef is null");

    return [AccessibilityElement elementWithRef:ref];
}

@end
