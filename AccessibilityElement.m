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

- (AccessibilityElement*) elementAtPositionX: (float)x Y: (float)y {
    AXUIElementRef ref = nil;
    AXError error = AXUIElementCopyElementAtPosition(elementRef, 100, 100, &ref);
    NSAssert(error == 0, @"could not get element at coordinates");
    return [AccessibilityElement elementWithRef: ref];
}

- (NSArray*) attributeNames {
    CFArrayRef names = nil;
    AXError error = AXUIElementCopyAttributeNames(elementRef, &names);
    NSAssert(error == 0, @"could not get element attribute names");
    return [NSArray arrayWithArray:(NSArray*)names];
}

- (CFTypeRef) attributeValueForName: (NSString*)name {
    CFTypeRef value = nil;
    AXError error = AXUIElementCopyAttributeValue(elementRef, (CFStringRef)name, &value);
    NSAssert(error == 0, @"could not get element attribute value");
    return value;
}

- (AccessibilityElement*) attributeValueAsElementForName: (NSString*)name {
    AXUIElementRef ref = (AXUIElementRef)[self attributeValueForName: name];
    return [AccessibilityElement elementWithRef:ref];
}

@end
