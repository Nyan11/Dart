Extension { #name : 'DartDocumentFederation' }

{ #category : '*DartRequirementFederation-Serialization' }
DartDocumentFederation >> stashAccessors [

	<stashAccessors>
	^ self requirementReferences collect: [ :req |
			  [ :fede | 'addRequirementReference: self <1s>' expandMacrosWith: req storeName ] onlySetOnStash ]
]

{ #category : '*DartRequirementFederation-Serialization' }
DartDocumentFederation >> storeIn: aClass [

	| body |
	aClass isClass ifFalse: [
		^ Error signal: 'Class needed but not provided.' ].
	self documentReferences do: [ :req | req storeIn: aClass ].
	self requirementReferences do: [ :req | req storeIn: aClass ].
	body := 'federation<r><r><t>%<DartFederation><r><t>^ <1s>' expandMacrosWith:
		        (Stash new serialize: self).
	aClass classSide
		compile: body
		classified: #'generated-document-federation'
]

{ #category : '*DartRequirementFederation-Serialization' }
DartDocumentFederation >> storeIn: aClass inPackage: aPackage [

	| class |
	class := self class classInstaller make: [ :aClassBuilder |
		  aClassBuilder
			  name: aClass asString;
			  package: aPackage ].
	self storeIn: class
]
