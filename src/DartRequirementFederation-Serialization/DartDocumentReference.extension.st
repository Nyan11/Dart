Extension { #name : 'DartDocumentReference' }

{ #category : '*DartRequirementFederation-Serialization' }
DartDocumentReference >> stashAccessors [

	<stashAccessors>
	^ { #documentNumber }
]

{ #category : '*DartRequirementFederation-Serialization' }
DartDocumentReference >> storeIn: arg1 [

	| tmp1 |
	arg1 isClass ifFalse: [
		^ Error signal: 'Class needed but not provided.' ].
	tmp1 := '<1s><r><r><t>%<DartDocument><r><t>^ <2s>'
		        expandMacrosWith: self storeName
		        with: (Stash new serialize: self).
	arg1 classSide
		compile: tmp1
		classified: #'generated-requirement-reference'
]

{ #category : '*DartRequirementFederation-Serialization' }
DartDocumentReference >> storeName [

	| tmp1 |
	tmp1 := '0000' , self documentNumber printString last: 4.
	^ 'doc_<1s>' expandMacrosWith: tmp1
]
