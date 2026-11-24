Class {
	#name : 'DartExample',
	#superclass : 'Object',
	#category : 'DartExample',
	#package : 'DartExample'
}

{ #category : 'generated-requirement-reference' }
DartExample class >> doc_0001 [

	<DartDocument>
	^ DartDocumentReference new
   documentNumber: 1;
   yourself
]

{ #category : 'generated-document-federation' }
DartExample class >> federation [

	^ DartDocumentFederation new
   addRequirementReference: self req_0001_0001;
   addRequirementReference: self req_0001_0002;
   addRequirementReference: self req_0001_0003;
   yourself
]

{ #category : 'accessing' }
DartExample class >> links [

	<DartLinks>
	^ DartLinkRepository new 
		addLinkToRequirement: self req_0001_0001 andBehavior: DartObjectExample >> #test1;
		addLinkToRequirement: self req_0001_0002 andBehavior: DartObjectExample >> #test2;
		yourself
]

{ #category : 'generated-requirement-reference' }
DartExample class >> req_0001_0001 [

	<DartRequirement>
	^ DartRequirementReference new
   contents: 'requirement 1 - This is the first requirement.
	item1
	item2';
   documentReference: self doc_0001;
   requirementNumber: 1;
   yourself
]

{ #category : 'generated-requirement-reference' }
DartExample class >> req_0001_0002 [

	<DartRequirement>
	^ DartRequirementReference new
   contents: 'requirement 2 - This is the second requirement.
	item1
	item2';
   documentReference: self doc_0001;
   requirementNumber: 2;
   yourself
]

{ #category : 'generated-requirement-reference' }
DartExample class >> req_0001_0003 [

	<DartRequirement>
	^ DartRequirementReference new
   contents: 'requirement 3 - This is the last Requirement.
';
   documentReference: self doc_0001;
   requirementNumber: 3;
   yourself
]
