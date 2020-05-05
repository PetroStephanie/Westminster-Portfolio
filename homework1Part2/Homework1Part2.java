package homework1Part2;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.MalformedURLException;
import java.net.URL;

/**
 * 
 * @author Stephanie Petrosyants
 * Assignment: Homework 1 Part 2 - File Copying from URL
 * Date: 9/4/2019
 *
 */


public class Homework1Part2 {

	public static void main(String[] args) throws Exception {

		//	Checks that a URL is present and will throw a MalformedURLException if a URL is not found
		// when the two arguments are being passed through the command line
		 try {
	          ImageFromURL(args[0], args[1]);

	       } catch (MalformedURLException e) {
	           e.printStackTrace();
	       } catch (IOException e) {
	            e.printStackTrace();
	       }
		 
		// Makes sure that only two command line arguments are passed
		if (args.length != 2) {
			System.err.println("Usage: <URL> <output file>");
			System.exit(0);
		}	
	}

	public static void ImageFromURL(String imageUrl, String destinationFile) throws IOException {
		
		URL url = new URL(imageUrl);
		
		// Input and Output streams are created to read in the URL and to output the image to the destination file
		InputStream is = url.openStream();
		OutputStream os = new FileOutputStream(destinationFile);

		// Create array of type byte
		byte[] b = new byte[2048];
		int i;

		
		// Read file from BufferedInputStream from argument 1 until no more bytes are left, during 
		// Which writing the same bytes to BufferedOutputStream named to string from argument 2
		while ((i = is.read(b)) > 0) {
			os.write(b, 0, i);
		}
		
		
		// Closes the input and output stream
		is.close();
		os.close();
	}

}
