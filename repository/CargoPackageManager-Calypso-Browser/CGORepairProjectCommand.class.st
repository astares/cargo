Class {
	#name : #CGORepairProjectCommand,
	#superclass : #CGOProjectCommand,
	#category : #'CargoPackageManager-Calypso-Browser-Commands'
}

{ #category : #testing }
CGORepairProjectCommand class >> canBeExecutedInContext: aToolContext [

	^ (aToolContext isProjectSelected and: [ aToolContext selectedProjectItems size = 1 ])
		and: [ aToolContext selectedProjectItems first actualObject project hasProblems ]
]

{ #category : #accessing }
CGORepairProjectCommand class >> defaultMenuIconName [
	^ #repair
]

{ #category : #activation }
CGORepairProjectCommand class >> defaultMenuItemName [
	^ 'Repair Project'
]

{ #category : #activation }
CGORepairProjectCommand class >> systemBrowserMenuActivator [
	<classAnnotation>
	
	^ CmdContextMenuActivation byRootGroupItemOrder: 1 for: PBProjectUIItem asCalypsoItemContext
]

{ #category : #execution }
CGORepairProjectCommand >> execute [
	
	self project openRepairDialog.

]
