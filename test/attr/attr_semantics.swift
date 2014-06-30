// RUN: %swift %s -parse -verify

@semantics("foo") // expected-note {{attribute already specified here}}
@semantics("bar") // expected-error {{duplicate attribute}}
func duplicatesemantics() {}

// Test parser recovery by having something that
// should parse fine.
func somethingThatShouldParseFine() {}

@!semantics("foo") // expected-error {{attribute may not be inverted}}
func invalidInversion() {}

func func_with_nested_semantics() {
   @semantics("exit") // expected-error {{attribute 'semantics' can only be used in a non-local scope}}
   func exit(code : UInt32) -> Void
   exit(0)
}

