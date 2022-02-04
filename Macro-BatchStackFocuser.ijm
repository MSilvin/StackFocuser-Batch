/* Code by
 *  Marine SILVIN
 *  silvinm@igbmc.fr
 *  February 2022
 *  
 *  Requirement:
 *  - StackFocuser (https://imagej.nih.gov/ij/plugins/stack-focuser.html)
 *  - czi files
 *  - stacks
 *  
 *  How to use:
 *  - Drag & Drop the .ijm file in Fiji
 *  - Click on run
 *  
 *  Notes:
 *  - Create a new folder for each treated images
 *  - save the inverted image + the stack focuser output
 *  - value of stack focuser to change
 */


macro "StackFocuser-Batch" {
 
 
	 //Set the extension you would like this macro to work with.
	// Do not add a . at the beggining
	extension = "czi";  //eg "lif", "vsi", etc...
	
	//Choose number of divisions in the global ROI area
	Dialog.create("Value for StackFocuser?");
	Dialog.addNumber("Enter a value", 11);
	Dialog.show();
	valueSF = Dialog.getNumber();
	
	// Beggining of macro. You should now have anything to edit after this line. 
	
	dir = getDirectory("Select a directory containing one or several ."+extension+" files.");
	
	files = getFileList(dir);
	
	
	setBatchMode(false);
	k=0;
	n=0;
	
	run("Bio-Formats Macro Extensions");
	for(f=0; f<files.length; f++) {
		if(endsWith(files[f], "."+extension)) {
			k++;
			id = dir+files[f];
			Ext.setId(id);
			Ext.getSeriesCount(seriesCount);
			//print(seriesCount+" series in "+id);
			n+=seriesCount;
	
			run("Bio-Formats Importer", "open=["+id+"] autoscale color_mode=Composite rois_import=[ROI manager] view=Hyperstack stack_order=XYCZT series_2");
			fullName	= getTitle();
			dirName 	= substring(fullName, 0,lastIndexOf(fullName, "."+extension));
			fileName 	= substring(fullName, lastIndexOf(fullName, " - ")+3, lengthOf(fullName));
			File.makeDirectory(dir+File.separator+dirName+File.separator);
			output = dir+File.separator+dirName+File.separator;
			print("Saving "+fileName+" under "+dir+File.separator+dirName);
				
			run("Split Channels");
				
			image2="C2-"+fullName;
			selectWindow(image2);
			run("Grays");
			run("Invert", "stack");
			run("Subtract Background...", "rolling=20");
				
			saveAs("tiff", output + image2 +"_inverted.tif");
			run("Stack Focuser ", "enter = valueSF");
				
			imageStackFocuser="Focused_C2-"+fullName;
			saveAs("tiff", output + imageStackFocuser + ".tif");
				
			run("Close All");
	
		}
	}
	Ext.close();
	setBatchMode(false);
	showMessage("Done with "+k+" files ! ");

}
