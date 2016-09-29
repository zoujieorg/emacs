function sayHello(name){
    console.log("Hello" + name);
}

var ojb = {
    concatString: function () {
	for(var i = 0; i <10; ++1){
	    var s1 = "hello";
	}
	var s2 = "world";
	var s3 = s1 + s2;
    },
    func1 : function() {
	this.concatString();
    },
    func2 : function() {
	add(1);
    }
};

console.log();
