macro "StackSif" {
	dirIn = getDirectory("Choose a directory...");

	files = getFileList(dirIn);
	print(files[1]);

	file = dirIn + files[0];

	print(file);
	print(files.length);

	run("Read SIF", "open=["+file+"]");

	rename(files[0]);

	// waitForUser( "Pause","Ready to start adding slices - Continue?");


	//setFont("SansSerif", 78, " antialiased");
	//setColor("#c9074e");

	//setSlice(1);
	//time = substring(files[0], 0,lengthOf(files[0])-4);
	//drawString(time, 100, 300);

	for (i=1; i< files.length-1 ; i++) {
		run("Add Slice");
		file = dirIn + files[i];
		print(i + " - " + files[i]);
		print(File.dateLastModified(file));
		run("Read SIF", "open=["+file+"]");
		rename(files[i]);
		run("Select All");
		run("Copy");
		close();
		selectWindow(files[0]);
		run("Paste");
		//setSlice(i+1);
		//time = substring(files[i], 0,lengthOf(files[i])-4);
		//drawString(time, 100, 300);
	}

	waitForUser( "Pause","Done!");

	//run("Invert", "stack");

	//run("Time Stamper", "starting=0 time=30 x=2 y=72 font=72 decimal=0 first=1 last=37 suffix=mins");

	//File.dateLastModified(path)

	run("Fire");

	doCommand("Start Animation [\\]");


}
