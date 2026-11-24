Extension { #name : 'DartRequirementReference' }

{ #category : '*DartRequirementFederation-Serialization' }
DartRequirementReference >> stashAccessors [

	<stashAccessors>
	^ {
		  #contents.
		  [ :req |
			  'documentReference: self <1s>' expandMacrosWith:
				  self documentReference storeName ] onlySetOnStash.
		  #requirementNumber }
]

{ #category : '*DartRequirementFederation-Serialization' }
DartRequirementReference >> storeIn: aClass [

	| body |
	aClass isClass ifFalse: [
		^ Error signal: 'Class needed but not provided.' ].
	body := '<1s><r><r><t>%<DartRequirement><r><t>^ <2s>'
		        expandMacrosWith: self storeName
		        with: (Stash new serialize: self).
	aClass classSide
		compile: body
		classified: #'generated-requirement-reference'.
	self storeMethod: aClass classSide >> self storeName asSymbol
]

{ #category : '*DartRequirementFederation-Serialization' }
DartRequirementReference >> storeName [

	| documentRequirementString requirementNumberString |
	requirementNumberString := '0000' , self requirementNumber printString last: 4.
	documentRequirementString := '0000' , self documentReference documentNumber printString last: 4.
	^ 'req_<1s>_<2s>'
		  expandMacrosWith: documentRequirementString
		  with: requirementNumberString
]
