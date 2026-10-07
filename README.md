# MultipleImage-TableViewCell-CameraCapture

**Table cells that collect several photos each:** tap a cell's button, take a photo with the camera, and see it appear in that row.

<p>
  <img alt="Swift" src="https://img.shields.io/badge/Swift-5-orange?style=flat-square">
  <img alt="UIKit" src="https://img.shields.io/badge/UIKit-UIImagePickerController-blue?style=flat-square">
  <img alt="Built" src="https://img.shields.io/badge/Built-2019-lightgrey?style=flat-square">
</p>

<img src="https://user-images.githubusercontent.com/23718584/70012170-bfdf9e80-15c7-11ea-9235-daf9618c82dd.png" width="280" alt="Table cells showing captured photos">

## What it demonstrates

- A custom cell with a title and a `UIStackView` of images
- Correct cell reuse: `prepareForReuse` clears old images so photos never appear in the wrong row
- A button callback from the cell to the view controller to open the camera
- Camera capture with `UIImagePickerController`, then updating only the affected row

## Running it

Open the project in Xcode and run it **on a real iPhone**, because the Simulator has no camera.

---

Built by **[Shruthi](https://github.com/shruezee)**, iOS developer in Sydney. See my latest apps from **Shruezee Studio**: **[Ashtotra](https://github.com/shruezee/Ashtotra-App)** (live on the App Store), **[KindDose](https://github.com/shruezee/KindDose)** and **[MiniMingle Games](https://github.com/shruezee/MiniMingle-Games)**.
