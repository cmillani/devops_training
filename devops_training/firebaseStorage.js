const admin = require("firebase-admin");
const fs = require('fs');

var serviceAccount = require("./firebase-key.json");

admin.initializeApp({
  credential: admin.credential.cert(serviceAccount),
  storageBucket: "gs://devops-learning-ios.appspot.com"
});

let result = allFilesFromDir("./screenshots").then(paths => {
  var bucket = admin.storage().bucket();
  recursiveUpload(paths, bucket).catch(console.log);
});


function uploadDirectory(dir) {
  
}

function bucketupload(file) {
  console.log(file);
  return new Promise((res, rej) => {
    res(null, "", null);
  });
}

function recursiveUpload(files, bucket) {
  var promises = [];
  files = files[Symbol.iterator]();
  function fileUpload(file) {
    let options = {
      destination: file.startsWith('./')? file.slice(2) : file
    }
    console.log(options);
    promises.push(bucket.upload(file, options).then(res => {
      var nextFile = files.next();
      if (nextFile.done) return;
      else return fileUpload(nextFile.value)
    }));
    return Promise.all(promises);
  }
  return fileUpload(files.next().value);
}

function allFilesFromDir(dir) {
  return new Promise((res,rej) => {
    var paths = [];
    var hasDir = fs.lstatSync(dir).isDirectory();
    function drillDirs(dirs) { 
      return new Promise((res1, rej) => {
        var promises = [];
        dirs.forEach(dir => { 
          promises.push(new Promise((res2, rej) => {
            fetchDir(dir).then(files => {
              paths.push(...files.filter(file => fs.lstatSync(file).isFile()));
              return files.filter(file => fs.lstatSync(file).isDirectory());
            }).then(dirs => {
              return dirs.length ? drillDirs(dirs) : null;
            }).then(res2);
          }));
          Promise.all(promises).then(res1)
        });
      });
    }
    drillDirs([dir]).then(_ => res(paths));
  })
}

function fetchDir(dir) {
  return new Promise((res, rej) => {
    fs.readdir(dir, (err, files) => {
      res(files.map(file => {
        return [dir, file].join('/');
      }));
    });
  });
}

