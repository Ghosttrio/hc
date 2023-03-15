
window.onload = () => {
	
	    document.querySelector("#tab1").classList.add("violet");
	    document.querySelector("#tab2").classList.add("violet2");
	    document.querySelector(".a2").style.display = "none";
	    for (let k = 1; k < 3; k++) {
	        document.querySelector("#tab"+k).addEventListener("click", () => {
	            for (let i = 1; i < 3; i++) {
	                if (i == k) {
	                	document.querySelector(".a" + i).style.display = "flex";
	                    document.querySelector("#tab" + i).classList.add("violet");
	                    document.querySelector("#tab" + i).classList.remove("violet2");
	                } else {
	                	document.querySelector(".a" + i).style.display = "none";
	                    document.querySelector("#tab" + i).classList.remove("violet");
	                    document.querySelector("#tab" + i).classList.add("violet2");
	                }
	            }
	        })
	    }
    
    
	
}