"
I represent a Metacello Project using a ConfigurationOf and act as a Cargo project.

	self exampleConfiguration inspect
"
Class {
	#name : #PBMetacelloConfigurationProject,
	#superclass : #PBMetacelloProject,
	#category : 'CargoPackageManager-Minimal-Model'
}

{ #category : #example }
PBMetacelloConfigurationProject class >> exampleConfiguration [
	^ self 
		fromProjectDependency: PBMetacelloConfigurationProjectDependency example
]

{ #category : #loading }
PBMetacelloConfigurationProject >> basicLoad [
	Metacello new 
		repository: repository asString;
		configuration: name;
		version: version;
		load: packageNames.
]

{ #category : #accessing }
PBMetacelloConfigurationProject >> isConfiguration [
	^ true
]
