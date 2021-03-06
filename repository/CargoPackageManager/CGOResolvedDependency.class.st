Class {
	#name : #CGOResolvedDependency,
	#superclass : #Object,
	#instVars : [
		'dependency',
		'resolution',
		'dependencyState'
	],
	#category : 'CargoPackageManager-Solver'
}

{ #category : #'instance-creation' }
CGOResolvedDependency class >> onDependency: aDependency resolution: aResolution [
	
	^ self new
		dependency: aDependency;
		resolution: aResolution;
		yourself
]

{ #category : #accessing }
CGOResolvedDependency >> allSubResolutions [
	
	^ { resolution }, resolution allSubResolutions asArray
]

{ #category : #conflicts }
CGOResolvedDependency >> checkConflictsWithDependencies: aDependencyCollection [
	
	| conflicts |
	conflicts := aDependencyCollection select: [ :each | each isConflictingWith: self ].
	dependencyState := dependencyState withConflicts: conflicts.
]

{ #category : #conflicts }
CGOResolvedDependency >> checkConflictsWithRegistry: aCGOPackageRegistry [

	| conflicts |
	conflicts := aCGOPackageRegistry conflictingProjectsWith: self.
	dependencyState := dependencyState withConflicts: conflicts.
]

{ #category : #conflicts }
CGOResolvedDependency >> conflictingDependencies [
	
	^ dependencyState conflictingDependencies
]

{ #category : #accessing }
CGOResolvedDependency >> dependency [
	^ dependency
]

{ #category : #accessing }
CGOResolvedDependency >> dependency: aDependency [ 
	dependency := aDependency
]

{ #category : #testing }
CGOResolvedDependency >> hasConflicts [
	
	^ dependencyState isConflictingDependency or: [ resolution hasConflicts ]
]

{ #category : #accessing }
CGOResolvedDependency >> initialize [

	super initialize.
	dependencyState := CGONonConflictingDependencyState new
]

{ #category : #conflicts }
CGOResolvedDependency >> isConflictingWith: aCGOResolvedDependency [ 
	
	^ (self dependency isSameProjectAs: aCGOResolvedDependency dependency)
		and: [ (resolution = aCGOResolvedDependency resolution) not ]
]

{ #category : #accessing }
CGOResolvedDependency >> name [
	
	^ dependency name
]

{ #category : #printing }
CGOResolvedDependency >> printOn: aStream [

	aStream
		<< self class name
		<< '('
		<< dependency asString
		<< ' => '
		<< resolution asString
		<< ')'
]

{ #category : #accessing }
CGOResolvedDependency >> projectName [
	^ resolution name
]

{ #category : #accessing }
CGOResolvedDependency >> resolution [
	^ resolution
]

{ #category : #accessing }
CGOResolvedDependency >> resolution: aResolution [ 
	resolution := aResolution
]

{ #category : #resolving }
CGOResolvedDependency >> resolveWith: aCGOResolvedProject [ 
	
	resolution := aCGOResolvedProject.
	dependencyState := CGONonConflictingDependencyState new.

]

{ #category : #resolving }
CGOResolvedDependency >> resolvesDependency: aDependency [ 
	
	^ dependency = aDependency
]

{ #category : #resolution }
CGOResolvedDependency >> resolvesProject: aProject [
	
	^ false
]

{ #category : #solving }
CGOResolvedDependency >> resolvesTarget: aResolutionTarget [ 
	
	^ resolution resolvedProjectVersion = aResolutionTarget
]

{ #category : #accessing }
CGOResolvedDependency >> subresolutions [
	
	^ { resolution }
]
