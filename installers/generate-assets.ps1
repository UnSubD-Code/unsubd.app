# Generates UnSubD-branded wizard images for Inno Setup
# Output: installers/assets/wizard-side.png (164x314) and wizard-small.png (55x55)
# Run once before compiling any installer.

Add-Type -AssemblyName System.Drawing

$outputDir = Join-Path $PSScriptRoot "assets"
if (-not (Test-Path $outputDir)) { New-Item -ItemType Directory -Path $outputDir | Out-Null }

# Brand colors
$bg       = [System.Drawing.Color]::FromArgb(255, 15,  15,  15)
$white    = [System.Drawing.Color]::FromArgb(255, 255, 255, 255)
$muted    = [System.Drawing.Color]::FromArgb(255, 102, 102, 102)
$orange   = [System.Drawing.Color]::FromArgb(255, 255, 69,  0)
$pink     = [System.Drawing.Color]::FromArgb(255, 255, 107, 203)
$cyan     = [System.Drawing.Color]::FromArgb(255, 0,   195, 255)

function New-GradientBrush($rect) {
    $brush = New-Object System.Drawing.Drawing2D.LinearGradientBrush(
        $rect, $orange, $cyan,
        [System.Drawing.Drawing2D.LinearGradientMode]::Horizontal
    )
    $blend = New-Object System.Drawing.Drawing2D.ColorBlend(3)
    $blend.Colors    = @($orange, $pink, $cyan)
    $blend.Positions = @(0.0, 0.5, 1.0)
    $brush.InterpolationColors = $blend
    return $brush
}

function New-RoundedPath($x, $y, $w, $h, $r) {
    $path = New-Object System.Drawing.Drawing2D.GraphicsPath
    $path.AddArc($x,           $y,           $r*2, $r*2, 180, 90)
    $path.AddArc($x+$w-$r*2,  $y,           $r*2, $r*2, 270, 90)
    $path.AddArc($x+$w-$r*2,  $y+$h-$r*2,  $r*2, $r*2,   0, 90)
    $path.AddArc($x,           $y+$h-$r*2,  $r*2, $r*2,  90, 90)
    $path.CloseFigure()
    return $path
}

# ─── Wizard side image (164 x 314) ───────────────────────────────────────────
$bmp = New-Object System.Drawing.Bitmap(164, 314)
$g   = [System.Drawing.Graphics]::FromImage($bmp)
$g.SmoothingMode      = [System.Drawing.Drawing2D.SmoothingMode]::AntiAlias
$g.TextRenderingHint  = [System.Drawing.Text.TextRenderingHint]::AntiAlias

$g.Clear($bg)

# Gradient bar across the top
$topRect  = New-Object System.Drawing.Rectangle(0, 0, 164, 7)
$topBrush = New-GradientBrush $topRect
$g.FillRectangle($topBrush, $topRect)
$topBrush.Dispose()

# "Un" in white
$fontBig    = New-Object System.Drawing.Font("Trebuchet MS", 24, [System.Drawing.FontStyle]::Bold)
$whiteBrush = New-Object System.Drawing.SolidBrush($white)
$unSize     = $g.MeasureString("Un", $fontBig)
$startX     = [int]((164 - $g.MeasureString("UnSubD", $fontBig).Width) / 2)
$g.DrawString("Un", $fontBig, $whiteBrush, $startX, 118)

# "SubD" in pink (closest single brand color to the gradient midpoint)
$pinkBrush  = New-Object System.Drawing.SolidBrush($pink)
$g.DrawString("SubD", $fontBig, $pinkBrush, $startX + $unSize.Width - 4, 118)

# Tagline
$fontTiny   = New-Object System.Drawing.Font("Trebuchet MS", 7, [System.Drawing.FontStyle]::Regular)
$mutedBrush = New-Object System.Drawing.SolidBrush($muted)
$tagline    = "FREE SOFTWARE. NO STRINGS."
$tagSize    = $g.MeasureString($tagline, $fontTiny)
$g.DrawString($tagline, $fontTiny, $mutedBrush, [int]((164 - $tagSize.Width) / 2), 276)

# Gradient line across the bottom
$botRect  = New-Object System.Drawing.Rectangle(0, 307, 164, 7)
$botBrush = New-GradientBrush $botRect
$g.FillRectangle($botBrush, $botRect)
$botBrush.Dispose()

$bmp.Save("$outputDir\wizard-side.png", [System.Drawing.Imaging.ImageFormat]::Png)
$g.Dispose(); $bmp.Dispose()
Write-Host "wizard-side.png created"

# ─── Small header image (55 x 55) ────────────────────────────────────────────
$sbmp = New-Object System.Drawing.Bitmap(55, 55)
$sg   = [System.Drawing.Graphics]::FromImage($sbmp)
$sg.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::AntiAlias

$sg.Clear($bg)

# Gradient rounded square
$iconRect  = New-Object System.Drawing.Rectangle(3, 3, 49, 49)
$iconBrush = New-GradientBrush $iconRect
$iconPath  = New-RoundedPath 3 3 49 49 10
$sg.FillPath($iconBrush, $iconPath)
$iconBrush.Dispose()

# "U" centered
$sfont      = New-Object System.Drawing.Font("Trebuchet MS", 26, [System.Drawing.FontStyle]::Bold)
$swhite     = New-Object System.Drawing.SolidBrush($white)
$sz         = $sg.MeasureString("U", $sfont)
$sg.DrawString("U", $sfont, $swhite, [int]((55 - $sz.Width) / 2) - 1, [int]((55 - $sz.Height) / 2))

$sbmp.Save("$outputDir\wizard-small.png", [System.Drawing.Imaging.ImageFormat]::Png)
$sg.Dispose(); $sbmp.Dispose()
Write-Host "wizard-small.png created"

Write-Host "`nDone. Files saved to: $outputDir"
