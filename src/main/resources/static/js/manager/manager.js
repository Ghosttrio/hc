    window.onload = function(){
		document.querySelector(".add").addEventListener("click",function(){
			let managerForm = document.managerForm
			managerForm.action="add.do";
			managerForm.method="post";
			managerForm.submit();
		});
		let a =document.querySelector(".count_end").value;
		for(let k=1; k<a+1; k++){
			document.querySelector(".update"+k).addEventListener("click", function(){
				console.log(k)
		        for (let i = 1; i < a; i++) {
		            if (i == k) {
		            	let managerForm = document.managerForm
						managerForm.action="update.do?articleNO="+document.querySelector(".articleNO"+k).value;
						managerForm.method="post";
						managerForm.submit();
		            }
		        }
		    })
		}
    }
