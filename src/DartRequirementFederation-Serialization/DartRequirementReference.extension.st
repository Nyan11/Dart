Extension { #name : 'DartRequirementReference' }

{ #category : '*DartRequirementFederation-Serialization' }
DartRequirementReference >> asStashConstructor [

	^ 'self <1s>' expandMacrosWith: self storeMethod selector
]

{ #category : '*DartRequirementFederation-Serialization' }
DartRequirementReference >> storeIn: aClass [

	| body |
	aClass isClass ifFalse: [
		^ Error signal: 'Class needed but not provided.' ].
	body := '<1s><r><r><t>%<DartRequirement><r>^ DartRequirementReference new<r><t><t>contents: <2p>;<r><t><t>yourself'
		        expandMacrosWith: self storeName
		        with: self contents.
	aClass classSide
		compile: body
		classified: #'generated-requirement-reference'.
	self storeMethod: aClass classSide >> self storeName asSymbol
]

{ #category : '*DartRequirementFederation-Serialization' }
DartRequirementReference >> storeName [

	| documentRequirementString requirementNumberString |
	requirementNumberString := '0000' , self requirementNumber printString last: 4.
	documentRequirementString := '0000' , self document documentNumber printString last: 4.
	^ 'req_<1s>_<2s>'
		  expandMacrosWith: documentRequirementString
		  with: requirementNumberString
]
