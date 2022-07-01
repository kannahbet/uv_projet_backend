let example = [
  {
    "Time": 1647672300000,
    "Open": 2937.37,
    "High": 2933.81,
    "Low": 2937.94,
    "Close": 2937.39,
    "Volume": 1547.5156
  },
  {
    "Time": 1647672300000,
    "Open": 2937.37,
    "High": 2933.81,
    "Low": 2937.94,
    "Close": 2937.39,
    "Volume": 1547.5156
  },
  {
    "Time": 1647672300000,
    "Open": 2937.37,
    "High": 2933.81,
    "Low": 2937.94,
    "Close": 2937.39,
    "Volume": 1547.5156
  },
  {
    "Time": 1647672300000,
    "Open": 2937.37,
    "High": 2933.81,
    "Low": 2937.94,
    "Close": 2937.39,
    "Volume": 1547.5156
  },

]

const getCSV = (object) => {
  let csv = Object.entries(Object.entries(object)[0][1]).map((e) => e[0]).join(",");
  for (const [k,v] of Object.entries(object)) {
    csv += "\r\n" + Object.values(v).join(",") // \n is enough in linux to reduce the csv size
  }
 //Uncomment for file download
  let j = document.createElement("a")
  j.download = "example_"+Date.now()+".csv"
  j.href = URL.createObjectURL(new Blob([csv]))
  j.click() 
  return csv;
}

console.log(
  getCSV(example)
)